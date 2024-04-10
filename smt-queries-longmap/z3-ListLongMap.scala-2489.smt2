; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38754 () Bool)

(assert start!38754)

(declare-fun b_free!9291 () Bool)

(declare-fun b_next!9291 () Bool)

(assert (=> start!38754 (= b_free!9291 (not b_next!9291))))

(declare-fun tp!32996 () Bool)

(declare-fun b_and!16677 () Bool)

(assert (=> start!38754 (= tp!32996 b_and!16677)))

(declare-fun b!403879 () Bool)

(declare-fun res!232812 () Bool)

(declare-fun e!243063 () Bool)

(assert (=> b!403879 (=> (not res!232812) (not e!243063))))

(declare-datatypes ((array!24243 0))(
  ( (array!24244 (arr!11571 (Array (_ BitVec 32) (_ BitVec 64))) (size!11923 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24243)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24243 (_ BitVec 32)) Bool)

(assert (=> b!403879 (= res!232812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!403880 () Bool)

(declare-fun e!243060 () Bool)

(declare-datatypes ((V!14669 0))(
  ( (V!14670 (val!5131 Int)) )
))
(declare-datatypes ((tuple2!6822 0))(
  ( (tuple2!6823 (_1!3422 (_ BitVec 64)) (_2!3422 V!14669)) )
))
(declare-datatypes ((List!6739 0))(
  ( (Nil!6736) (Cons!6735 (h!7591 tuple2!6822) (t!11913 List!6739)) )
))
(declare-datatypes ((ListLongMap!5735 0))(
  ( (ListLongMap!5736 (toList!2883 List!6739)) )
))
(declare-fun call!28537 () ListLongMap!5735)

(declare-fun call!28538 () ListLongMap!5735)

(assert (=> b!403880 (= e!243060 (= call!28537 call!28538))))

(declare-fun b!403882 () Bool)

(declare-fun res!232821 () Bool)

(declare-fun e!243061 () Bool)

(assert (=> b!403882 (=> (not res!232821) (not e!243061))))

(declare-fun lt!188098 () array!24243)

(declare-datatypes ((List!6740 0))(
  ( (Nil!6737) (Cons!6736 (h!7592 (_ BitVec 64)) (t!11914 List!6740)) )
))
(declare-fun arrayNoDuplicates!0 (array!24243 (_ BitVec 32) List!6740) Bool)

(assert (=> b!403882 (= res!232821 (arrayNoDuplicates!0 lt!188098 #b00000000000000000000000000000000 Nil!6737))))

(declare-fun b!403883 () Bool)

(declare-fun e!243057 () Bool)

(declare-fun tp_is_empty!10173 () Bool)

(assert (=> b!403883 (= e!243057 tp_is_empty!10173)))

(declare-fun b!403884 () Bool)

(assert (=> b!403884 (= e!243061 (not true))))

(assert (=> b!403884 e!243060))

(declare-fun c!54893 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!403884 (= c!54893 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12216 0))(
  ( (Unit!12217) )
))
(declare-fun lt!188099 () Unit!12216)

(declare-fun minValue!515 () V!14669)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4743 0))(
  ( (ValueCellFull!4743 (v!7378 V!14669)) (EmptyCell!4743) )
))
(declare-datatypes ((array!24245 0))(
  ( (array!24246 (arr!11572 (Array (_ BitVec 32) ValueCell!4743)) (size!11924 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24245)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!14669)

(declare-fun zeroValue!515 () V!14669)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!366 (array!24243 array!24245 (_ BitVec 32) (_ BitVec 32) V!14669 V!14669 (_ BitVec 32) (_ BitVec 64) V!14669 (_ BitVec 32) Int) Unit!12216)

(assert (=> b!403884 (= lt!188099 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!366 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403885 () Bool)

(declare-fun res!232813 () Bool)

(assert (=> b!403885 (=> (not res!232813) (not e!243063))))

(declare-fun arrayContainsKey!0 (array!24243 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!403885 (= res!232813 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!403886 () Bool)

(declare-fun res!232811 () Bool)

(assert (=> b!403886 (=> (not res!232811) (not e!243063))))

(assert (=> b!403886 (= res!232811 (and (= (size!11924 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11923 _keys!709) (size!11924 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun bm!28534 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1091 (array!24243 array!24245 (_ BitVec 32) (_ BitVec 32) V!14669 V!14669 (_ BitVec 32) Int) ListLongMap!5735)

(assert (=> bm!28534 (= call!28537 (getCurrentListMapNoExtraKeys!1091 (ite c!54893 _keys!709 lt!188098) (ite c!54893 _values!549 (array!24246 (store (arr!11572 _values!549) i!563 (ValueCellFull!4743 v!412)) (size!11924 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!16881 () Bool)

(declare-fun mapRes!16881 () Bool)

(assert (=> mapIsEmpty!16881 mapRes!16881))

(declare-fun b!403887 () Bool)

(declare-fun res!232816 () Bool)

(assert (=> b!403887 (=> (not res!232816) (not e!243063))))

(assert (=> b!403887 (= res!232816 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6737))))

(declare-fun b!403888 () Bool)

(declare-fun res!232818 () Bool)

(assert (=> b!403888 (=> (not res!232818) (not e!243063))))

(assert (=> b!403888 (= res!232818 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11923 _keys!709))))))

(declare-fun mapNonEmpty!16881 () Bool)

(declare-fun tp!32997 () Bool)

(declare-fun e!243062 () Bool)

(assert (=> mapNonEmpty!16881 (= mapRes!16881 (and tp!32997 e!243062))))

(declare-fun mapValue!16881 () ValueCell!4743)

(declare-fun mapKey!16881 () (_ BitVec 32))

(declare-fun mapRest!16881 () (Array (_ BitVec 32) ValueCell!4743))

(assert (=> mapNonEmpty!16881 (= (arr!11572 _values!549) (store mapRest!16881 mapKey!16881 mapValue!16881))))

(declare-fun res!232810 () Bool)

(assert (=> start!38754 (=> (not res!232810) (not e!243063))))

(assert (=> start!38754 (= res!232810 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11923 _keys!709))))))

(assert (=> start!38754 e!243063))

(assert (=> start!38754 tp_is_empty!10173))

(assert (=> start!38754 tp!32996))

(assert (=> start!38754 true))

(declare-fun e!243059 () Bool)

(declare-fun array_inv!8466 (array!24245) Bool)

(assert (=> start!38754 (and (array_inv!8466 _values!549) e!243059)))

(declare-fun array_inv!8467 (array!24243) Bool)

(assert (=> start!38754 (array_inv!8467 _keys!709)))

(declare-fun b!403881 () Bool)

(declare-fun res!232814 () Bool)

(assert (=> b!403881 (=> (not res!232814) (not e!243063))))

(assert (=> b!403881 (= res!232814 (or (= (select (arr!11571 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11571 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!403889 () Bool)

(declare-fun +!1157 (ListLongMap!5735 tuple2!6822) ListLongMap!5735)

(assert (=> b!403889 (= e!243060 (= call!28538 (+!1157 call!28537 (tuple2!6823 k0!794 v!412))))))

(declare-fun b!403890 () Bool)

(assert (=> b!403890 (= e!243062 tp_is_empty!10173)))

(declare-fun b!403891 () Bool)

(declare-fun res!232819 () Bool)

(assert (=> b!403891 (=> (not res!232819) (not e!243063))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!403891 (= res!232819 (validKeyInArray!0 k0!794))))

(declare-fun b!403892 () Bool)

(assert (=> b!403892 (= e!243063 e!243061)))

(declare-fun res!232817 () Bool)

(assert (=> b!403892 (=> (not res!232817) (not e!243061))))

(assert (=> b!403892 (= res!232817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188098 mask!1025))))

(assert (=> b!403892 (= lt!188098 (array!24244 (store (arr!11571 _keys!709) i!563 k0!794) (size!11923 _keys!709)))))

(declare-fun bm!28535 () Bool)

(assert (=> bm!28535 (= call!28538 (getCurrentListMapNoExtraKeys!1091 (ite c!54893 lt!188098 _keys!709) (ite c!54893 (array!24246 (store (arr!11572 _values!549) i!563 (ValueCellFull!4743 v!412)) (size!11924 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403893 () Bool)

(assert (=> b!403893 (= e!243059 (and e!243057 mapRes!16881))))

(declare-fun condMapEmpty!16881 () Bool)

(declare-fun mapDefault!16881 () ValueCell!4743)

(assert (=> b!403893 (= condMapEmpty!16881 (= (arr!11572 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4743)) mapDefault!16881)))))

(declare-fun b!403894 () Bool)

(declare-fun res!232815 () Bool)

(assert (=> b!403894 (=> (not res!232815) (not e!243063))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!403894 (= res!232815 (validMask!0 mask!1025))))

(declare-fun b!403895 () Bool)

(declare-fun res!232820 () Bool)

(assert (=> b!403895 (=> (not res!232820) (not e!243061))))

(assert (=> b!403895 (= res!232820 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11923 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(assert (= (and start!38754 res!232810) b!403894))

(assert (= (and b!403894 res!232815) b!403886))

(assert (= (and b!403886 res!232811) b!403879))

(assert (= (and b!403879 res!232812) b!403887))

(assert (= (and b!403887 res!232816) b!403888))

(assert (= (and b!403888 res!232818) b!403891))

(assert (= (and b!403891 res!232819) b!403881))

(assert (= (and b!403881 res!232814) b!403885))

(assert (= (and b!403885 res!232813) b!403892))

(assert (= (and b!403892 res!232817) b!403882))

(assert (= (and b!403882 res!232821) b!403895))

(assert (= (and b!403895 res!232820) b!403884))

(assert (= (and b!403884 c!54893) b!403889))

(assert (= (and b!403884 (not c!54893)) b!403880))

(assert (= (or b!403889 b!403880) bm!28535))

(assert (= (or b!403889 b!403880) bm!28534))

(assert (= (and b!403893 condMapEmpty!16881) mapIsEmpty!16881))

(assert (= (and b!403893 (not condMapEmpty!16881)) mapNonEmpty!16881))

(get-info :version)

(assert (= (and mapNonEmpty!16881 ((_ is ValueCellFull!4743) mapValue!16881)) b!403890))

(assert (= (and b!403893 ((_ is ValueCellFull!4743) mapDefault!16881)) b!403883))

(assert (= start!38754 b!403893))

(declare-fun m!396923 () Bool)

(assert (=> b!403879 m!396923))

(declare-fun m!396925 () Bool)

(assert (=> b!403884 m!396925))

(declare-fun m!396927 () Bool)

(assert (=> b!403882 m!396927))

(declare-fun m!396929 () Bool)

(assert (=> b!403889 m!396929))

(declare-fun m!396931 () Bool)

(assert (=> bm!28535 m!396931))

(declare-fun m!396933 () Bool)

(assert (=> bm!28535 m!396933))

(declare-fun m!396935 () Bool)

(assert (=> b!403881 m!396935))

(declare-fun m!396937 () Bool)

(assert (=> mapNonEmpty!16881 m!396937))

(declare-fun m!396939 () Bool)

(assert (=> b!403887 m!396939))

(declare-fun m!396941 () Bool)

(assert (=> b!403885 m!396941))

(declare-fun m!396943 () Bool)

(assert (=> b!403891 m!396943))

(declare-fun m!396945 () Bool)

(assert (=> start!38754 m!396945))

(declare-fun m!396947 () Bool)

(assert (=> start!38754 m!396947))

(declare-fun m!396949 () Bool)

(assert (=> b!403894 m!396949))

(declare-fun m!396951 () Bool)

(assert (=> b!403892 m!396951))

(declare-fun m!396953 () Bool)

(assert (=> b!403892 m!396953))

(assert (=> bm!28534 m!396931))

(declare-fun m!396955 () Bool)

(assert (=> bm!28534 m!396955))

(check-sat (not b!403885) (not b!403889) (not bm!28535) (not b!403879) (not start!38754) (not b_next!9291) (not b!403884) (not b!403882) (not mapNonEmpty!16881) (not b!403894) (not b!403892) b_and!16677 (not b!403887) tp_is_empty!10173 (not b!403891) (not bm!28534))
(check-sat b_and!16677 (not b_next!9291))
