; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35784 () Bool)

(assert start!35784)

(declare-fun mapIsEmpty!13863 () Bool)

(declare-fun mapRes!13863 () Bool)

(assert (=> mapIsEmpty!13863 mapRes!13863))

(declare-fun b!359444 () Bool)

(declare-fun e!220157 () Bool)

(declare-fun tp_is_empty!8237 () Bool)

(assert (=> b!359444 (= e!220157 tp_is_empty!8237)))

(declare-fun b!359445 () Bool)

(declare-fun e!220153 () Bool)

(assert (=> b!359445 (= e!220153 tp_is_empty!8237)))

(declare-fun b!359446 () Bool)

(declare-fun e!220154 () Bool)

(assert (=> b!359446 (= e!220154 false)))

(declare-fun lt!166343 () Bool)

(declare-datatypes ((array!20031 0))(
  ( (array!20032 (arr!9509 (Array (_ BitVec 32) (_ BitVec 64))) (size!9861 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20031)

(declare-datatypes ((List!5468 0))(
  ( (Nil!5465) (Cons!5464 (h!6320 (_ BitVec 64)) (t!10618 List!5468)) )
))
(declare-fun arrayNoDuplicates!0 (array!20031 (_ BitVec 32) List!5468) Bool)

(assert (=> b!359446 (= lt!166343 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5465))))

(declare-fun res!199781 () Bool)

(assert (=> start!35784 (=> (not res!199781) (not e!220154))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35784 (= res!199781 (validMask!0 mask!1842))))

(assert (=> start!35784 e!220154))

(assert (=> start!35784 true))

(declare-datatypes ((V!11959 0))(
  ( (V!11960 (val!4163 Int)) )
))
(declare-datatypes ((ValueCell!3775 0))(
  ( (ValueCellFull!3775 (v!6357 V!11959)) (EmptyCell!3775) )
))
(declare-datatypes ((array!20033 0))(
  ( (array!20034 (arr!9510 (Array (_ BitVec 32) ValueCell!3775)) (size!9862 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20033)

(declare-fun e!220155 () Bool)

(declare-fun array_inv!6994 (array!20033) Bool)

(assert (=> start!35784 (and (array_inv!6994 _values!1208) e!220155)))

(declare-fun array_inv!6995 (array!20031) Bool)

(assert (=> start!35784 (array_inv!6995 _keys!1456)))

(declare-fun mapNonEmpty!13863 () Bool)

(declare-fun tp!27930 () Bool)

(assert (=> mapNonEmpty!13863 (= mapRes!13863 (and tp!27930 e!220153))))

(declare-fun mapRest!13863 () (Array (_ BitVec 32) ValueCell!3775))

(declare-fun mapValue!13863 () ValueCell!3775)

(declare-fun mapKey!13863 () (_ BitVec 32))

(assert (=> mapNonEmpty!13863 (= (arr!9510 _values!1208) (store mapRest!13863 mapKey!13863 mapValue!13863))))

(declare-fun b!359447 () Bool)

(declare-fun res!199782 () Bool)

(assert (=> b!359447 (=> (not res!199782) (not e!220154))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!359447 (= res!199782 (and (= (size!9862 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9861 _keys!1456) (size!9862 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!359448 () Bool)

(declare-fun res!199783 () Bool)

(assert (=> b!359448 (=> (not res!199783) (not e!220154))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20031 (_ BitVec 32)) Bool)

(assert (=> b!359448 (= res!199783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359449 () Bool)

(assert (=> b!359449 (= e!220155 (and e!220157 mapRes!13863))))

(declare-fun condMapEmpty!13863 () Bool)

(declare-fun mapDefault!13863 () ValueCell!3775)

