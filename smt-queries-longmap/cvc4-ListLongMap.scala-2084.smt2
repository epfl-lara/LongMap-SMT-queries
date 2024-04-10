; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35676 () Bool)

(assert start!35676)

(declare-fun b!358373 () Bool)

(declare-fun res!199196 () Bool)

(declare-fun e!219345 () Bool)

(assert (=> b!358373 (=> (not res!199196) (not e!219345))))

(declare-datatypes ((array!19823 0))(
  ( (array!19824 (arr!9405 (Array (_ BitVec 32) (_ BitVec 64))) (size!9757 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19823)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19823 (_ BitVec 32)) Bool)

(assert (=> b!358373 (= res!199196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapIsEmpty!13701 () Bool)

(declare-fun mapRes!13701 () Bool)

(assert (=> mapIsEmpty!13701 mapRes!13701))

(declare-fun b!358374 () Bool)

(declare-fun res!199198 () Bool)

(assert (=> b!358374 (=> (not res!199198) (not e!219345))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-datatypes ((V!11815 0))(
  ( (V!11816 (val!4109 Int)) )
))
(declare-datatypes ((ValueCell!3721 0))(
  ( (ValueCellFull!3721 (v!6303 V!11815)) (EmptyCell!3721) )
))
(declare-datatypes ((array!19825 0))(
  ( (array!19826 (arr!9406 (Array (_ BitVec 32) ValueCell!3721)) (size!9758 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19825)

(assert (=> b!358374 (= res!199198 (and (= (size!9758 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9757 _keys!1456) (size!9758 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun res!199197 () Bool)

(assert (=> start!35676 (=> (not res!199197) (not e!219345))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35676 (= res!199197 (validMask!0 mask!1842))))

(assert (=> start!35676 e!219345))

(assert (=> start!35676 true))

(declare-fun e!219344 () Bool)

(declare-fun array_inv!6914 (array!19825) Bool)

(assert (=> start!35676 (and (array_inv!6914 _values!1208) e!219344)))

(declare-fun array_inv!6915 (array!19823) Bool)

(assert (=> start!35676 (array_inv!6915 _keys!1456)))

(declare-fun mapNonEmpty!13701 () Bool)

(declare-fun tp!27759 () Bool)

(declare-fun e!219346 () Bool)

(assert (=> mapNonEmpty!13701 (= mapRes!13701 (and tp!27759 e!219346))))

(declare-fun mapValue!13701 () ValueCell!3721)

(declare-fun mapRest!13701 () (Array (_ BitVec 32) ValueCell!3721))

(declare-fun mapKey!13701 () (_ BitVec 32))

(assert (=> mapNonEmpty!13701 (= (arr!9406 _values!1208) (store mapRest!13701 mapKey!13701 mapValue!13701))))

(declare-fun b!358375 () Bool)

(declare-fun e!219343 () Bool)

(declare-fun tp_is_empty!8129 () Bool)

(assert (=> b!358375 (= e!219343 tp_is_empty!8129)))

(declare-fun b!358376 () Bool)

(assert (=> b!358376 (= e!219346 tp_is_empty!8129)))

(declare-fun b!358377 () Bool)

(assert (=> b!358377 (= e!219344 (and e!219343 mapRes!13701))))

(declare-fun condMapEmpty!13701 () Bool)

(declare-fun mapDefault!13701 () ValueCell!3721)

