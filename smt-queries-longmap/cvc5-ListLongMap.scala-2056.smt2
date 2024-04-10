; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35504 () Bool)

(assert start!35504)

(declare-fun b!355808 () Bool)

(declare-fun e!217976 () Bool)

(declare-fun tp_is_empty!7957 () Bool)

(assert (=> b!355808 (= e!217976 tp_is_empty!7957)))

(declare-fun b!355809 () Bool)

(declare-fun res!197405 () Bool)

(declare-fun e!217974 () Bool)

(assert (=> b!355809 (=> (not res!197405) (not e!217974))))

(declare-datatypes ((array!19491 0))(
  ( (array!19492 (arr!9239 (Array (_ BitVec 32) (_ BitVec 64))) (size!9591 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19491)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19491 (_ BitVec 32)) Bool)

(assert (=> b!355809 (= res!197405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun res!197407 () Bool)

(assert (=> start!35504 (=> (not res!197407) (not e!217974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35504 (= res!197407 (validMask!0 mask!1842))))

(assert (=> start!35504 e!217974))

(assert (=> start!35504 true))

(declare-datatypes ((V!11587 0))(
  ( (V!11588 (val!4023 Int)) )
))
(declare-datatypes ((ValueCell!3635 0))(
  ( (ValueCellFull!3635 (v!6217 V!11587)) (EmptyCell!3635) )
))
(declare-datatypes ((array!19493 0))(
  ( (array!19494 (arr!9240 (Array (_ BitVec 32) ValueCell!3635)) (size!9592 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19493)

(declare-fun e!217975 () Bool)

(declare-fun array_inv!6792 (array!19493) Bool)

(assert (=> start!35504 (and (array_inv!6792 _values!1208) e!217975)))

(declare-fun array_inv!6793 (array!19491) Bool)

(assert (=> start!35504 (array_inv!6793 _keys!1456)))

(declare-fun b!355810 () Bool)

(declare-fun res!197406 () Bool)

(assert (=> b!355810 (=> (not res!197406) (not e!217974))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!355810 (= res!197406 (and (= (size!9592 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9591 _keys!1456) (size!9592 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13443 () Bool)

(declare-fun mapRes!13443 () Bool)

(declare-fun tp!27420 () Bool)

(assert (=> mapNonEmpty!13443 (= mapRes!13443 (and tp!27420 e!217976))))

(declare-fun mapKey!13443 () (_ BitVec 32))

(declare-fun mapRest!13443 () (Array (_ BitVec 32) ValueCell!3635))

(declare-fun mapValue!13443 () ValueCell!3635)

(assert (=> mapNonEmpty!13443 (= (arr!9240 _values!1208) (store mapRest!13443 mapKey!13443 mapValue!13443))))

(declare-fun b!355811 () Bool)

(declare-fun e!217973 () Bool)

(assert (=> b!355811 (= e!217975 (and e!217973 mapRes!13443))))

(declare-fun condMapEmpty!13443 () Bool)

(declare-fun mapDefault!13443 () ValueCell!3635)

