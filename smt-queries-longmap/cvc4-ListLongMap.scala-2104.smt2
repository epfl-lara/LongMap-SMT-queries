; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35796 () Bool)

(assert start!35796)

(declare-fun mapNonEmpty!13881 () Bool)

(declare-fun mapRes!13881 () Bool)

(declare-fun tp!27948 () Bool)

(declare-fun e!220244 () Bool)

(assert (=> mapNonEmpty!13881 (= mapRes!13881 (and tp!27948 e!220244))))

(declare-datatypes ((V!11975 0))(
  ( (V!11976 (val!4169 Int)) )
))
(declare-datatypes ((ValueCell!3781 0))(
  ( (ValueCellFull!3781 (v!6363 V!11975)) (EmptyCell!3781) )
))
(declare-datatypes ((array!20053 0))(
  ( (array!20054 (arr!9520 (Array (_ BitVec 32) ValueCell!3781)) (size!9872 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20053)

(declare-fun mapValue!13881 () ValueCell!3781)

(declare-fun mapRest!13881 () (Array (_ BitVec 32) ValueCell!3781))

(declare-fun mapKey!13881 () (_ BitVec 32))

(assert (=> mapNonEmpty!13881 (= (arr!9520 _values!1208) (store mapRest!13881 mapKey!13881 mapValue!13881))))

(declare-fun res!199836 () Bool)

(declare-fun e!220245 () Bool)

(assert (=> start!35796 (=> (not res!199836) (not e!220245))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35796 (= res!199836 (validMask!0 mask!1842))))

(assert (=> start!35796 e!220245))

(assert (=> start!35796 true))

(declare-fun e!220247 () Bool)

(declare-fun array_inv!7004 (array!20053) Bool)

(assert (=> start!35796 (and (array_inv!7004 _values!1208) e!220247)))

(declare-datatypes ((array!20055 0))(
  ( (array!20056 (arr!9521 (Array (_ BitVec 32) (_ BitVec 64))) (size!9873 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20055)

(declare-fun array_inv!7005 (array!20055) Bool)

(assert (=> start!35796 (array_inv!7005 _keys!1456)))

(declare-fun b!359552 () Bool)

(declare-fun e!220243 () Bool)

(declare-fun tp_is_empty!8249 () Bool)

(assert (=> b!359552 (= e!220243 tp_is_empty!8249)))

(declare-fun b!359553 () Bool)

(assert (=> b!359553 (= e!220247 (and e!220243 mapRes!13881))))

(declare-fun condMapEmpty!13881 () Bool)

(declare-fun mapDefault!13881 () ValueCell!3781)

