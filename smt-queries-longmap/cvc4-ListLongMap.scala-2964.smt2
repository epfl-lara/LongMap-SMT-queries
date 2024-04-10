; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42044 () Bool)

(assert start!42044)

(declare-fun b_free!11597 () Bool)

(declare-fun b_next!11597 () Bool)

(assert (=> start!42044 (= b_free!11597 (not b_next!11597))))

(declare-fun tp!40809 () Bool)

(declare-fun b_and!20007 () Bool)

(assert (=> start!42044 (= tp!40809 b_and!20007)))

(declare-fun b!469397 () Bool)

(declare-fun e!274849 () Bool)

(declare-fun e!274851 () Bool)

(assert (=> b!469397 (= e!274849 (not e!274851))))

(declare-fun res!280501 () Bool)

(assert (=> b!469397 (=> res!280501 e!274851)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!469397 (= res!280501 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18471 0))(
  ( (V!18472 (val!6557 Int)) )
))
(declare-datatypes ((tuple2!8628 0))(
  ( (tuple2!8629 (_1!4325 (_ BitVec 64)) (_2!4325 V!18471)) )
))
(declare-datatypes ((List!8709 0))(
  ( (Nil!8706) (Cons!8705 (h!9561 tuple2!8628) (t!14669 List!8709)) )
))
(declare-datatypes ((ListLongMap!7541 0))(
  ( (ListLongMap!7542 (toList!3786 List!8709)) )
))
(declare-fun lt!212675 () ListLongMap!7541)

(declare-fun lt!212673 () ListLongMap!7541)

(assert (=> b!469397 (= lt!212675 lt!212673)))

(declare-fun minValueBefore!38 () V!18471)

(declare-fun zeroValue!794 () V!18471)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13729 0))(
  ( (Unit!13730) )
))
(declare-fun lt!212672 () Unit!13729)

(declare-datatypes ((array!29823 0))(
  ( (array!29824 (arr!14336 (Array (_ BitVec 32) (_ BitVec 64))) (size!14688 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29823)

(declare-datatypes ((ValueCell!6169 0))(
  ( (ValueCellFull!6169 (v!8847 V!18471)) (EmptyCell!6169) )
))
(declare-datatypes ((array!29825 0))(
  ( (array!29826 (arr!14337 (Array (_ BitVec 32) ValueCell!6169)) (size!14689 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29825)

(declare-fun minValueAfter!38 () V!18471)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!134 (array!29823 array!29825 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18471 V!18471 V!18471 V!18471 (_ BitVec 32) Int) Unit!13729)

(assert (=> b!469397 (= lt!212672 (lemmaNoChangeToArrayThenSameMapNoExtras!134 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1954 (array!29823 array!29825 (_ BitVec 32) (_ BitVec 32) V!18471 V!18471 (_ BitVec 32) Int) ListLongMap!7541)

(assert (=> b!469397 (= lt!212673 (getCurrentListMapNoExtraKeys!1954 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469397 (= lt!212675 (getCurrentListMapNoExtraKeys!1954 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469398 () Bool)

(declare-fun e!274847 () Bool)

(declare-fun e!274850 () Bool)

(declare-fun mapRes!21235 () Bool)

(assert (=> b!469398 (= e!274847 (and e!274850 mapRes!21235))))

(declare-fun condMapEmpty!21235 () Bool)

(declare-fun mapDefault!21235 () ValueCell!6169)

