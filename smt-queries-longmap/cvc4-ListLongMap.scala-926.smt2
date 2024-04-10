; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20656 () Bool)

(assert start!20656)

(declare-fun b_free!5315 () Bool)

(declare-fun b_next!5315 () Bool)

(assert (=> start!20656 (= b_free!5315 (not b_next!5315))))

(declare-fun tp!18976 () Bool)

(declare-fun b_and!12061 () Bool)

(assert (=> start!20656 (= tp!18976 b_and!12061)))

(declare-fun b!206316 () Bool)

(declare-fun e!134860 () Bool)

(declare-fun tp_is_empty!5171 () Bool)

(assert (=> b!206316 (= e!134860 tp_is_empty!5171)))

(declare-fun mapIsEmpty!8825 () Bool)

(declare-fun mapRes!8825 () Bool)

(assert (=> mapIsEmpty!8825 mapRes!8825))

(declare-fun b!206318 () Bool)

(declare-fun res!99918 () Bool)

(declare-fun e!134857 () Bool)

(assert (=> b!206318 (=> (not res!99918) (not e!134857))))

(declare-datatypes ((array!9553 0))(
  ( (array!9554 (arr!4527 (Array (_ BitVec 32) (_ BitVec 64))) (size!4852 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9553)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6541 0))(
  ( (V!6542 (val!2630 Int)) )
))
(declare-datatypes ((ValueCell!2242 0))(
  ( (ValueCellFull!2242 (v!4600 V!6541)) (EmptyCell!2242) )
))
(declare-datatypes ((array!9555 0))(
  ( (array!9556 (arr!4528 (Array (_ BitVec 32) ValueCell!2242)) (size!4853 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9555)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!206318 (= res!99918 (and (= (size!4853 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4852 _keys!825) (size!4853 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!206319 () Bool)

(declare-fun e!134859 () Bool)

(assert (=> b!206319 (= e!134857 (not e!134859))))

(declare-fun res!99921 () Bool)

(assert (=> b!206319 (=> res!99921 e!134859)))

(assert (=> b!206319 (= res!99921 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!3996 0))(
  ( (tuple2!3997 (_1!2009 (_ BitVec 64)) (_2!2009 V!6541)) )
))
(declare-datatypes ((List!2888 0))(
  ( (Nil!2885) (Cons!2884 (h!3526 tuple2!3996) (t!7819 List!2888)) )
))
(declare-datatypes ((ListLongMap!2909 0))(
  ( (ListLongMap!2910 (toList!1470 List!2888)) )
))
(declare-fun lt!105453 () ListLongMap!2909)

(declare-fun zeroValue!615 () V!6541)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6541)

(declare-fun getCurrentListMap!1037 (array!9553 array!9555 (_ BitVec 32) (_ BitVec 32) V!6541 V!6541 (_ BitVec 32) Int) ListLongMap!2909)

(assert (=> b!206319 (= lt!105453 (getCurrentListMap!1037 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105448 () array!9555)

(declare-fun lt!105457 () ListLongMap!2909)

(assert (=> b!206319 (= lt!105457 (getCurrentListMap!1037 _keys!825 lt!105448 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105459 () ListLongMap!2909)

(declare-fun lt!105455 () ListLongMap!2909)

(assert (=> b!206319 (and (= lt!105459 lt!105455) (= lt!105455 lt!105459))))

(declare-fun lt!105458 () ListLongMap!2909)

(declare-fun lt!105452 () tuple2!3996)

(declare-fun +!497 (ListLongMap!2909 tuple2!3996) ListLongMap!2909)

(assert (=> b!206319 (= lt!105455 (+!497 lt!105458 lt!105452))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun v!520 () V!6541)

(assert (=> b!206319 (= lt!105452 (tuple2!3997 k!843 v!520))))

(declare-datatypes ((Unit!6282 0))(
  ( (Unit!6283) )
))
(declare-fun lt!105450 () Unit!6282)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!150 (array!9553 array!9555 (_ BitVec 32) (_ BitVec 32) V!6541 V!6541 (_ BitVec 32) (_ BitVec 64) V!6541 (_ BitVec 32) Int) Unit!6282)

(assert (=> b!206319 (= lt!105450 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!150 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!411 (array!9553 array!9555 (_ BitVec 32) (_ BitVec 32) V!6541 V!6541 (_ BitVec 32) Int) ListLongMap!2909)

(assert (=> b!206319 (= lt!105459 (getCurrentListMapNoExtraKeys!411 _keys!825 lt!105448 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206319 (= lt!105448 (array!9556 (store (arr!4528 _values!649) i!601 (ValueCellFull!2242 v!520)) (size!4853 _values!649)))))

(assert (=> b!206319 (= lt!105458 (getCurrentListMapNoExtraKeys!411 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!206320 () Bool)

(declare-fun res!99917 () Bool)

(assert (=> b!206320 (=> (not res!99917) (not e!134857))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9553 (_ BitVec 32)) Bool)

(assert (=> b!206320 (= res!99917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!206321 () Bool)

(declare-fun e!134858 () Bool)

(assert (=> b!206321 (= e!134858 tp_is_empty!5171)))

(declare-fun b!206322 () Bool)

(declare-fun res!99915 () Bool)

(assert (=> b!206322 (=> (not res!99915) (not e!134857))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206322 (= res!99915 (validKeyInArray!0 k!843))))

(declare-fun b!206323 () Bool)

(declare-fun e!134861 () Bool)

(assert (=> b!206323 (= e!134859 e!134861)))

(declare-fun res!99920 () Bool)

(assert (=> b!206323 (=> res!99920 e!134861)))

(assert (=> b!206323 (= res!99920 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!105454 () ListLongMap!2909)

(assert (=> b!206323 (= lt!105453 lt!105454)))

(declare-fun lt!105456 () tuple2!3996)

(assert (=> b!206323 (= lt!105454 (+!497 lt!105458 lt!105456))))

(declare-fun lt!105451 () ListLongMap!2909)

(assert (=> b!206323 (= lt!105457 lt!105451)))

(assert (=> b!206323 (= lt!105451 (+!497 lt!105455 lt!105456))))

(assert (=> b!206323 (= lt!105457 (+!497 lt!105459 lt!105456))))

(assert (=> b!206323 (= lt!105456 (tuple2!3997 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!206324 () Bool)

(declare-fun res!99922 () Bool)

(assert (=> b!206324 (=> (not res!99922) (not e!134857))))

(assert (=> b!206324 (= res!99922 (= (select (arr!4527 _keys!825) i!601) k!843))))

(declare-fun b!206325 () Bool)

(declare-fun res!99916 () Bool)

(assert (=> b!206325 (=> (not res!99916) (not e!134857))))

(assert (=> b!206325 (= res!99916 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4852 _keys!825))))))

(declare-fun b!206326 () Bool)

(assert (=> b!206326 (= e!134861 true)))

(assert (=> b!206326 (= lt!105451 (+!497 lt!105454 lt!105452))))

(declare-fun lt!105449 () Unit!6282)

(declare-fun addCommutativeForDiffKeys!195 (ListLongMap!2909 (_ BitVec 64) V!6541 (_ BitVec 64) V!6541) Unit!6282)

(assert (=> b!206326 (= lt!105449 (addCommutativeForDiffKeys!195 lt!105458 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!206327 () Bool)

(declare-fun e!134856 () Bool)

(assert (=> b!206327 (= e!134856 (and e!134858 mapRes!8825))))

(declare-fun condMapEmpty!8825 () Bool)

(declare-fun mapDefault!8825 () ValueCell!2242)

