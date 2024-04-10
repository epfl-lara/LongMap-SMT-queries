; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41166 () Bool)

(assert start!41166)

(declare-fun b_free!11035 () Bool)

(declare-fun b_next!11035 () Bool)

(assert (=> start!41166 (= b_free!11035 (not b_next!11035))))

(declare-fun tp!38940 () Bool)

(declare-fun b_and!19309 () Bool)

(assert (=> start!41166 (= tp!38940 b_and!19309)))

(declare-fun b!459875 () Bool)

(declare-fun e!268353 () Bool)

(declare-fun e!268350 () Bool)

(assert (=> b!459875 (= e!268353 e!268350)))

(declare-fun res!274888 () Bool)

(assert (=> b!459875 (=> (not res!274888) (not e!268350))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!459875 (= res!274888 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!17603 0))(
  ( (V!17604 (val!6231 Int)) )
))
(declare-fun minValue!515 () V!17603)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5843 0))(
  ( (ValueCellFull!5843 (v!8509 V!17603)) (EmptyCell!5843) )
))
(declare-datatypes ((array!28547 0))(
  ( (array!28548 (arr!13714 (Array (_ BitVec 32) ValueCell!5843)) (size!14066 (_ BitVec 32))) )
))
(declare-fun lt!208103 () array!28547)

(declare-datatypes ((tuple2!8216 0))(
  ( (tuple2!8217 (_1!4119 (_ BitVec 64)) (_2!4119 V!17603)) )
))
(declare-datatypes ((List!8288 0))(
  ( (Nil!8285) (Cons!8284 (h!9140 tuple2!8216) (t!14202 List!8288)) )
))
(declare-datatypes ((ListLongMap!7129 0))(
  ( (ListLongMap!7130 (toList!3580 List!8288)) )
))
(declare-fun lt!208099 () ListLongMap!7129)

(declare-fun zeroValue!515 () V!17603)

(declare-datatypes ((array!28549 0))(
  ( (array!28550 (arr!13715 (Array (_ BitVec 32) (_ BitVec 64))) (size!14067 (_ BitVec 32))) )
))
(declare-fun lt!208106 () array!28549)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1760 (array!28549 array!28547 (_ BitVec 32) (_ BitVec 32) V!17603 V!17603 (_ BitVec 32) Int) ListLongMap!7129)

(assert (=> b!459875 (= lt!208099 (getCurrentListMapNoExtraKeys!1760 lt!208106 lt!208103 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!28547)

(declare-fun v!412 () V!17603)

(assert (=> b!459875 (= lt!208103 (array!28548 (store (arr!13714 _values!549) i!563 (ValueCellFull!5843 v!412)) (size!14066 _values!549)))))

(declare-fun lt!208098 () ListLongMap!7129)

(declare-fun _keys!709 () array!28549)

(assert (=> b!459875 (= lt!208098 (getCurrentListMapNoExtraKeys!1760 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!459876 () Bool)

(declare-fun e!268355 () Bool)

(assert (=> b!459876 (= e!268350 (not e!268355))))

(declare-fun res!274889 () Bool)

(assert (=> b!459876 (=> res!274889 e!268355)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!459876 (= res!274889 (not (validKeyInArray!0 (select (arr!13715 _keys!709) from!863))))))

(declare-fun lt!208096 () ListLongMap!7129)

(declare-fun lt!208092 () ListLongMap!7129)

(assert (=> b!459876 (= lt!208096 lt!208092)))

(declare-fun lt!208093 () ListLongMap!7129)

(declare-fun lt!208104 () tuple2!8216)

(declare-fun +!1616 (ListLongMap!7129 tuple2!8216) ListLongMap!7129)

(assert (=> b!459876 (= lt!208092 (+!1616 lt!208093 lt!208104))))

(assert (=> b!459876 (= lt!208096 (getCurrentListMapNoExtraKeys!1760 lt!208106 lt!208103 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!459876 (= lt!208104 (tuple2!8217 k!794 v!412))))

(assert (=> b!459876 (= lt!208093 (getCurrentListMapNoExtraKeys!1760 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!13373 0))(
  ( (Unit!13374) )
))
(declare-fun lt!208095 () Unit!13373)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!772 (array!28549 array!28547 (_ BitVec 32) (_ BitVec 32) V!17603 V!17603 (_ BitVec 32) (_ BitVec 64) V!17603 (_ BitVec 32) Int) Unit!13373)

(assert (=> b!459876 (= lt!208095 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!772 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!459877 () Bool)

(declare-fun e!268358 () Bool)

(assert (=> b!459877 (= e!268358 true)))

(declare-fun lt!208100 () ListLongMap!7129)

(declare-fun lt!208102 () tuple2!8216)

(assert (=> b!459877 (= lt!208100 (+!1616 (+!1616 lt!208093 lt!208102) lt!208104))))

(declare-fun lt!208097 () Unit!13373)

(declare-fun lt!208105 () V!17603)

(declare-fun addCommutativeForDiffKeys!427 (ListLongMap!7129 (_ BitVec 64) V!17603 (_ BitVec 64) V!17603) Unit!13373)

(assert (=> b!459877 (= lt!208097 (addCommutativeForDiffKeys!427 lt!208093 k!794 v!412 (select (arr!13715 _keys!709) from!863) lt!208105))))

(declare-fun b!459878 () Bool)

(declare-fun res!274884 () Bool)

(declare-fun e!268354 () Bool)

(assert (=> b!459878 (=> (not res!274884) (not e!268354))))

(declare-fun arrayContainsKey!0 (array!28549 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!459878 (= res!274884 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!459879 () Bool)

(declare-fun res!274883 () Bool)

(assert (=> b!459879 (=> (not res!274883) (not e!268354))))

(declare-datatypes ((List!8289 0))(
  ( (Nil!8286) (Cons!8285 (h!9141 (_ BitVec 64)) (t!14203 List!8289)) )
))
(declare-fun arrayNoDuplicates!0 (array!28549 (_ BitVec 32) List!8289) Bool)

(assert (=> b!459879 (= res!274883 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8286))))

(declare-fun res!274882 () Bool)

(assert (=> start!41166 (=> (not res!274882) (not e!268354))))

(assert (=> start!41166 (= res!274882 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14067 _keys!709))))))

(assert (=> start!41166 e!268354))

(declare-fun tp_is_empty!12373 () Bool)

(assert (=> start!41166 tp_is_empty!12373))

(assert (=> start!41166 tp!38940))

(assert (=> start!41166 true))

(declare-fun e!268359 () Bool)

(declare-fun array_inv!9918 (array!28547) Bool)

(assert (=> start!41166 (and (array_inv!9918 _values!549) e!268359)))

(declare-fun array_inv!9919 (array!28549) Bool)

(assert (=> start!41166 (array_inv!9919 _keys!709)))

(declare-fun b!459880 () Bool)

(declare-fun res!274879 () Bool)

(assert (=> b!459880 (=> (not res!274879) (not e!268353))))

(assert (=> b!459880 (= res!274879 (bvsle from!863 i!563))))

(declare-fun b!459881 () Bool)

(declare-fun e!268351 () Unit!13373)

(declare-fun Unit!13375 () Unit!13373)

(assert (=> b!459881 (= e!268351 Unit!13375)))

(declare-fun lt!208094 () Unit!13373)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28549 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13373)

(assert (=> b!459881 (= lt!208094 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!459881 false))

(declare-fun b!459882 () Bool)

(assert (=> b!459882 (= e!268355 e!268358)))

(declare-fun res!274890 () Bool)

(assert (=> b!459882 (=> res!274890 e!268358)))

(assert (=> b!459882 (= res!274890 (= k!794 (select (arr!13715 _keys!709) from!863)))))

(assert (=> b!459882 (not (= (select (arr!13715 _keys!709) from!863) k!794))))

(declare-fun lt!208101 () Unit!13373)

(assert (=> b!459882 (= lt!208101 e!268351)))

(declare-fun c!56501 () Bool)

(assert (=> b!459882 (= c!56501 (= (select (arr!13715 _keys!709) from!863) k!794))))

(assert (=> b!459882 (= lt!208099 lt!208100)))

(assert (=> b!459882 (= lt!208100 (+!1616 lt!208092 lt!208102))))

(assert (=> b!459882 (= lt!208102 (tuple2!8217 (select (arr!13715 _keys!709) from!863) lt!208105))))

(declare-fun get!6768 (ValueCell!5843 V!17603) V!17603)

(declare-fun dynLambda!902 (Int (_ BitVec 64)) V!17603)

(assert (=> b!459882 (= lt!208105 (get!6768 (select (arr!13714 _values!549) from!863) (dynLambda!902 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!459883 () Bool)

(declare-fun Unit!13376 () Unit!13373)

(assert (=> b!459883 (= e!268351 Unit!13376)))

(declare-fun b!459884 () Bool)

(declare-fun e!268357 () Bool)

(assert (=> b!459884 (= e!268357 tp_is_empty!12373)))

(declare-fun b!459885 () Bool)

(declare-fun res!274887 () Bool)

(assert (=> b!459885 (=> (not res!274887) (not e!268354))))

(assert (=> b!459885 (= res!274887 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14067 _keys!709))))))

(declare-fun mapIsEmpty!20209 () Bool)

(declare-fun mapRes!20209 () Bool)

(assert (=> mapIsEmpty!20209 mapRes!20209))

(declare-fun b!459886 () Bool)

(declare-fun res!274886 () Bool)

(assert (=> b!459886 (=> (not res!274886) (not e!268354))))

(assert (=> b!459886 (= res!274886 (validKeyInArray!0 k!794))))

(declare-fun b!459887 () Bool)

(declare-fun res!274885 () Bool)

(assert (=> b!459887 (=> (not res!274885) (not e!268353))))

(assert (=> b!459887 (= res!274885 (arrayNoDuplicates!0 lt!208106 #b00000000000000000000000000000000 Nil!8286))))

(declare-fun b!459888 () Bool)

(declare-fun res!274880 () Bool)

(assert (=> b!459888 (=> (not res!274880) (not e!268354))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28549 (_ BitVec 32)) Bool)

(assert (=> b!459888 (= res!274880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!459889 () Bool)

(declare-fun e!268352 () Bool)

(assert (=> b!459889 (= e!268352 tp_is_empty!12373)))

(declare-fun b!459890 () Bool)

(declare-fun res!274881 () Bool)

(assert (=> b!459890 (=> (not res!274881) (not e!268354))))

(assert (=> b!459890 (= res!274881 (or (= (select (arr!13715 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13715 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!20209 () Bool)

(declare-fun tp!38941 () Bool)

(assert (=> mapNonEmpty!20209 (= mapRes!20209 (and tp!38941 e!268352))))

(declare-fun mapRest!20209 () (Array (_ BitVec 32) ValueCell!5843))

(declare-fun mapValue!20209 () ValueCell!5843)

(declare-fun mapKey!20209 () (_ BitVec 32))

(assert (=> mapNonEmpty!20209 (= (arr!13714 _values!549) (store mapRest!20209 mapKey!20209 mapValue!20209))))

(declare-fun b!459891 () Bool)

(declare-fun res!274877 () Bool)

(assert (=> b!459891 (=> (not res!274877) (not e!268354))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!459891 (= res!274877 (validMask!0 mask!1025))))

(declare-fun b!459892 () Bool)

(assert (=> b!459892 (= e!268359 (and e!268357 mapRes!20209))))

(declare-fun condMapEmpty!20209 () Bool)

(declare-fun mapDefault!20209 () ValueCell!5843)

