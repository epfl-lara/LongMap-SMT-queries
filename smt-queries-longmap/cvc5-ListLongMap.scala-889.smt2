; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20430 () Bool)

(assert start!20430)

(declare-fun b_free!5089 () Bool)

(declare-fun b_next!5089 () Bool)

(assert (=> start!20430 (= b_free!5089 (not b_next!5089))))

(declare-fun tp!18298 () Bool)

(declare-fun b_and!11835 () Bool)

(assert (=> start!20430 (= tp!18298 b_and!11835)))

(declare-fun b!202230 () Bool)

(declare-fun e!132483 () Bool)

(declare-datatypes ((array!9115 0))(
  ( (array!9116 (arr!4308 (Array (_ BitVec 32) (_ BitVec 64))) (size!4633 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9115)

(assert (=> b!202230 (= e!132483 (bvsle #b00000000000000000000000000000000 (size!4633 _keys!825)))))

(declare-datatypes ((V!6241 0))(
  ( (V!6242 (val!2517 Int)) )
))
(declare-datatypes ((tuple2!3814 0))(
  ( (tuple2!3815 (_1!1918 (_ BitVec 64)) (_2!1918 V!6241)) )
))
(declare-fun lt!101427 () tuple2!3814)

(declare-datatypes ((List!2722 0))(
  ( (Nil!2719) (Cons!2718 (h!3360 tuple2!3814) (t!7653 List!2722)) )
))
(declare-datatypes ((ListLongMap!2727 0))(
  ( (ListLongMap!2728 (toList!1379 List!2722)) )
))
(declare-fun lt!101433 () ListLongMap!2727)

(declare-fun lt!101425 () tuple2!3814)

(declare-fun lt!101432 () ListLongMap!2727)

(declare-fun +!406 (ListLongMap!2727 tuple2!3814) ListLongMap!2727)

(assert (=> b!202230 (= (+!406 lt!101432 lt!101425) (+!406 lt!101433 lt!101427))))

(declare-fun minValue!615 () V!6241)

(declare-fun lt!101436 () ListLongMap!2727)

(declare-fun v!520 () V!6241)

(declare-fun k!843 () (_ BitVec 64))

(declare-datatypes ((Unit!6112 0))(
  ( (Unit!6113) )
))
(declare-fun lt!101438 () Unit!6112)

(declare-fun addCommutativeForDiffKeys!127 (ListLongMap!2727 (_ BitVec 64) V!6241 (_ BitVec 64) V!6241) Unit!6112)

(assert (=> b!202230 (= lt!101438 (addCommutativeForDiffKeys!127 lt!101436 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!202231 () Bool)

(declare-fun e!132485 () Bool)

(assert (=> b!202231 (= e!132485 e!132483)))

(declare-fun res!96849 () Bool)

(assert (=> b!202231 (=> res!96849 e!132483)))

(assert (=> b!202231 (= res!96849 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!101431 () ListLongMap!2727)

(assert (=> b!202231 (= lt!101431 lt!101432)))

(assert (=> b!202231 (= lt!101432 (+!406 lt!101436 lt!101427))))

(declare-fun lt!101434 () Unit!6112)

(declare-fun lt!101426 () ListLongMap!2727)

(declare-fun zeroValue!615 () V!6241)

(assert (=> b!202231 (= lt!101434 (addCommutativeForDiffKeys!127 lt!101426 k!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!101429 () ListLongMap!2727)

(assert (=> b!202231 (= lt!101429 (+!406 lt!101431 lt!101425))))

(declare-fun lt!101435 () ListLongMap!2727)

(declare-fun lt!101428 () tuple2!3814)

(assert (=> b!202231 (= lt!101431 (+!406 lt!101435 lt!101428))))

(declare-fun lt!101430 () ListLongMap!2727)

(assert (=> b!202231 (= lt!101430 lt!101433)))

(assert (=> b!202231 (= lt!101433 (+!406 lt!101436 lt!101425))))

(assert (=> b!202231 (= lt!101436 (+!406 lt!101426 lt!101428))))

(declare-fun lt!101424 () ListLongMap!2727)

(assert (=> b!202231 (= lt!101429 (+!406 (+!406 lt!101424 lt!101428) lt!101425))))

(assert (=> b!202231 (= lt!101425 (tuple2!3815 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!202231 (= lt!101428 (tuple2!3815 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202232 () Bool)

(declare-fun res!96847 () Bool)

(declare-fun e!132486 () Bool)

(assert (=> b!202232 (=> (not res!96847) (not e!132486))))

(declare-datatypes ((List!2723 0))(
  ( (Nil!2720) (Cons!2719 (h!3361 (_ BitVec 64)) (t!7654 List!2723)) )
))
(declare-fun arrayNoDuplicates!0 (array!9115 (_ BitVec 32) List!2723) Bool)

(assert (=> b!202232 (= res!96847 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2720))))

(declare-fun b!202233 () Bool)

(declare-fun res!96851 () Bool)

(assert (=> b!202233 (=> (not res!96851) (not e!132486))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!202233 (= res!96851 (validKeyInArray!0 k!843))))

(declare-fun b!202234 () Bool)

(declare-fun res!96845 () Bool)

(assert (=> b!202234 (=> (not res!96845) (not e!132486))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((ValueCell!2129 0))(
  ( (ValueCellFull!2129 (v!4487 V!6241)) (EmptyCell!2129) )
))
(declare-datatypes ((array!9117 0))(
  ( (array!9118 (arr!4309 (Array (_ BitVec 32) ValueCell!2129)) (size!4634 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9117)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!202234 (= res!96845 (and (= (size!4634 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4633 _keys!825) (size!4634 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!202235 () Bool)

(assert (=> b!202235 (= e!132486 (not e!132485))))

(declare-fun res!96848 () Bool)

(assert (=> b!202235 (=> res!96848 e!132485)))

(assert (=> b!202235 (= res!96848 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!962 (array!9115 array!9117 (_ BitVec 32) (_ BitVec 32) V!6241 V!6241 (_ BitVec 32) Int) ListLongMap!2727)

(assert (=> b!202235 (= lt!101430 (getCurrentListMap!962 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101437 () array!9117)

(assert (=> b!202235 (= lt!101429 (getCurrentListMap!962 _keys!825 lt!101437 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202235 (and (= lt!101424 lt!101435) (= lt!101435 lt!101424))))

(assert (=> b!202235 (= lt!101435 (+!406 lt!101426 lt!101427))))

(assert (=> b!202235 (= lt!101427 (tuple2!3815 k!843 v!520))))

(declare-fun lt!101439 () Unit!6112)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!75 (array!9115 array!9117 (_ BitVec 32) (_ BitVec 32) V!6241 V!6241 (_ BitVec 32) (_ BitVec 64) V!6241 (_ BitVec 32) Int) Unit!6112)

(assert (=> b!202235 (= lt!101439 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!75 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!336 (array!9115 array!9117 (_ BitVec 32) (_ BitVec 32) V!6241 V!6241 (_ BitVec 32) Int) ListLongMap!2727)

(assert (=> b!202235 (= lt!101424 (getCurrentListMapNoExtraKeys!336 _keys!825 lt!101437 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202235 (= lt!101437 (array!9118 (store (arr!4309 _values!649) i!601 (ValueCellFull!2129 v!520)) (size!4634 _values!649)))))

(assert (=> b!202235 (= lt!101426 (getCurrentListMapNoExtraKeys!336 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!202236 () Bool)

(declare-fun res!96852 () Bool)

(assert (=> b!202236 (=> (not res!96852) (not e!132486))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9115 (_ BitVec 32)) Bool)

(assert (=> b!202236 (= res!96852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!202237 () Bool)

(declare-fun e!132488 () Bool)

(declare-fun e!132487 () Bool)

(declare-fun mapRes!8486 () Bool)

(assert (=> b!202237 (= e!132488 (and e!132487 mapRes!8486))))

(declare-fun condMapEmpty!8486 () Bool)

(declare-fun mapDefault!8486 () ValueCell!2129)

