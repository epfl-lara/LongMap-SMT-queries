; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40810 () Bool)

(assert start!40810)

(declare-fun b_free!10799 () Bool)

(declare-fun b_next!10799 () Bool)

(assert (=> start!40810 (= b_free!10799 (not b_next!10799))))

(declare-fun tp!38219 () Bool)

(declare-fun b_and!18885 () Bool)

(assert (=> start!40810 (= tp!38219 b_and!18885)))

(declare-datatypes ((V!17287 0))(
  ( (V!17288 (val!6113 Int)) )
))
(declare-fun minValue!515 () V!17287)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!28081 0))(
  ( (array!28082 (arr!13485 (Array (_ BitVec 32) (_ BitVec 64))) (size!13837 (_ BitVec 32))) )
))
(declare-fun lt!205528 () array!28081)

(declare-datatypes ((tuple2!8052 0))(
  ( (tuple2!8053 (_1!4037 (_ BitVec 64)) (_2!4037 V!17287)) )
))
(declare-datatypes ((List!8109 0))(
  ( (Nil!8106) (Cons!8105 (h!8961 tuple2!8052) (t!13931 List!8109)) )
))
(declare-datatypes ((ListLongMap!6965 0))(
  ( (ListLongMap!6966 (toList!3498 List!8109)) )
))
(declare-fun call!30010 () ListLongMap!6965)

(declare-fun zeroValue!515 () V!17287)

(declare-datatypes ((ValueCell!5725 0))(
  ( (ValueCellFull!5725 (v!8372 V!17287)) (EmptyCell!5725) )
))
(declare-datatypes ((array!28083 0))(
  ( (array!28084 (arr!13486 (Array (_ BitVec 32) ValueCell!5725)) (size!13838 (_ BitVec 32))) )
))
(declare-fun lt!205521 () array!28083)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!28081)

(declare-fun c!56147 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun _values!549 () array!28083)

(declare-fun bm!30007 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1681 (array!28081 array!28083 (_ BitVec 32) (_ BitVec 32) V!17287 V!17287 (_ BitVec 32) Int) ListLongMap!6965)

(assert (=> bm!30007 (= call!30010 (getCurrentListMapNoExtraKeys!1681 (ite c!56147 _keys!709 lt!205528) (ite c!56147 _values!549 lt!205521) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452943 () Bool)

(declare-fun e!265147 () Bool)

(assert (=> b!452943 (= e!265147 true)))

(declare-fun lt!205525 () tuple2!8052)

(declare-fun lt!205522 () V!17287)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun lt!205519 () ListLongMap!6965)

(declare-fun +!1574 (ListLongMap!6965 tuple2!8052) ListLongMap!6965)

(assert (=> b!452943 (= (+!1574 lt!205519 lt!205525) (+!1574 (+!1574 lt!205519 (tuple2!8053 k!794 lt!205522)) lt!205525))))

(declare-fun lt!205526 () V!17287)

(assert (=> b!452943 (= lt!205525 (tuple2!8053 k!794 lt!205526))))

(declare-datatypes ((Unit!13244 0))(
  ( (Unit!13245) )
))
(declare-fun lt!205520 () Unit!13244)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!85 (ListLongMap!6965 (_ BitVec 64) V!17287 V!17287) Unit!13244)

(assert (=> b!452943 (= lt!205520 (addSameAsAddTwiceSameKeyDiffValues!85 lt!205519 k!794 lt!205522 lt!205526))))

(declare-fun lt!205529 () V!17287)

(declare-fun get!6649 (ValueCell!5725 V!17287) V!17287)

(assert (=> b!452943 (= lt!205522 (get!6649 (select (arr!13486 _values!549) from!863) lt!205529))))

(declare-fun lt!205524 () ListLongMap!6965)

(assert (=> b!452943 (= lt!205524 (+!1574 lt!205519 (tuple2!8053 (select (arr!13485 lt!205528) from!863) lt!205526)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!17287)

(assert (=> b!452943 (= lt!205526 (get!6649 (select (store (arr!13486 _values!549) i!563 (ValueCellFull!5725 v!412)) from!863) lt!205529))))

(declare-fun dynLambda!872 (Int (_ BitVec 64)) V!17287)

(assert (=> b!452943 (= lt!205529 (dynLambda!872 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!452943 (= lt!205519 (getCurrentListMapNoExtraKeys!1681 lt!205528 lt!205521 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452944 () Bool)

(declare-fun res!269853 () Bool)

(declare-fun e!265141 () Bool)

(assert (=> b!452944 (=> (not res!269853) (not e!265141))))

(declare-fun arrayContainsKey!0 (array!28081 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!452944 (= res!269853 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!452945 () Bool)

(declare-fun e!265144 () Bool)

(declare-fun tp_is_empty!12137 () Bool)

(assert (=> b!452945 (= e!265144 tp_is_empty!12137)))

(declare-fun b!452946 () Bool)

(declare-fun res!269845 () Bool)

(assert (=> b!452946 (=> (not res!269845) (not e!265141))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!452946 (= res!269845 (validKeyInArray!0 k!794))))

(declare-fun mapNonEmpty!19842 () Bool)

(declare-fun mapRes!19842 () Bool)

(declare-fun tp!38220 () Bool)

(declare-fun e!265148 () Bool)

(assert (=> mapNonEmpty!19842 (= mapRes!19842 (and tp!38220 e!265148))))

(declare-fun mapValue!19842 () ValueCell!5725)

(declare-fun mapKey!19842 () (_ BitVec 32))

(declare-fun mapRest!19842 () (Array (_ BitVec 32) ValueCell!5725))

(assert (=> mapNonEmpty!19842 (= (arr!13486 _values!549) (store mapRest!19842 mapKey!19842 mapValue!19842))))

(declare-fun b!452947 () Bool)

(declare-fun res!269846 () Bool)

(declare-fun e!265145 () Bool)

(assert (=> b!452947 (=> (not res!269846) (not e!265145))))

(assert (=> b!452947 (= res!269846 (bvsle from!863 i!563))))

(declare-fun res!269850 () Bool)

(assert (=> start!40810 (=> (not res!269850) (not e!265141))))

(assert (=> start!40810 (= res!269850 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13837 _keys!709))))))

(assert (=> start!40810 e!265141))

(assert (=> start!40810 tp_is_empty!12137))

(assert (=> start!40810 tp!38219))

(assert (=> start!40810 true))

(declare-fun e!265140 () Bool)

(declare-fun array_inv!9768 (array!28083) Bool)

(assert (=> start!40810 (and (array_inv!9768 _values!549) e!265140)))

(declare-fun array_inv!9769 (array!28081) Bool)

(assert (=> start!40810 (array_inv!9769 _keys!709)))

(declare-fun b!452948 () Bool)

(declare-fun res!269843 () Bool)

(assert (=> b!452948 (=> (not res!269843) (not e!265141))))

(declare-datatypes ((List!8110 0))(
  ( (Nil!8107) (Cons!8106 (h!8962 (_ BitVec 64)) (t!13932 List!8110)) )
))
(declare-fun arrayNoDuplicates!0 (array!28081 (_ BitVec 32) List!8110) Bool)

(assert (=> b!452948 (= res!269843 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8107))))

(declare-fun b!452949 () Bool)

(declare-fun res!269851 () Bool)

(assert (=> b!452949 (=> (not res!269851) (not e!265141))))

(assert (=> b!452949 (= res!269851 (and (= (size!13838 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13837 _keys!709) (size!13838 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!452950 () Bool)

(declare-fun res!269852 () Bool)

(assert (=> b!452950 (=> (not res!269852) (not e!265141))))

(assert (=> b!452950 (= res!269852 (or (= (select (arr!13485 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13485 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!30008 () Bool)

(declare-fun call!30011 () ListLongMap!6965)

(assert (=> bm!30008 (= call!30011 (getCurrentListMapNoExtraKeys!1681 (ite c!56147 lt!205528 _keys!709) (ite c!56147 lt!205521 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452951 () Bool)

(assert (=> b!452951 (= e!265141 e!265145)))

(declare-fun res!269844 () Bool)

(assert (=> b!452951 (=> (not res!269844) (not e!265145))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28081 (_ BitVec 32)) Bool)

(assert (=> b!452951 (= res!269844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205528 mask!1025))))

(assert (=> b!452951 (= lt!205528 (array!28082 (store (arr!13485 _keys!709) i!563 k!794) (size!13837 _keys!709)))))

(declare-fun b!452952 () Bool)

(declare-fun e!265146 () Bool)

(assert (=> b!452952 (= e!265145 e!265146)))

(declare-fun res!269849 () Bool)

(assert (=> b!452952 (=> (not res!269849) (not e!265146))))

(assert (=> b!452952 (= res!269849 (= from!863 i!563))))

(assert (=> b!452952 (= lt!205524 (getCurrentListMapNoExtraKeys!1681 lt!205528 lt!205521 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!452952 (= lt!205521 (array!28084 (store (arr!13486 _values!549) i!563 (ValueCellFull!5725 v!412)) (size!13838 _values!549)))))

(declare-fun lt!205527 () ListLongMap!6965)

(assert (=> b!452952 (= lt!205527 (getCurrentListMapNoExtraKeys!1681 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!452953 () Bool)

(declare-fun e!265143 () Bool)

(assert (=> b!452953 (= e!265143 (= call!30010 call!30011))))

(declare-fun b!452954 () Bool)

(assert (=> b!452954 (= e!265143 (= call!30011 (+!1574 call!30010 (tuple2!8053 k!794 v!412))))))

(declare-fun b!452955 () Bool)

(declare-fun res!269854 () Bool)

(assert (=> b!452955 (=> (not res!269854) (not e!265145))))

(assert (=> b!452955 (= res!269854 (arrayNoDuplicates!0 lt!205528 #b00000000000000000000000000000000 Nil!8107))))

(declare-fun b!452956 () Bool)

(assert (=> b!452956 (= e!265148 tp_is_empty!12137)))

(declare-fun b!452957 () Bool)

(declare-fun res!269855 () Bool)

(assert (=> b!452957 (=> (not res!269855) (not e!265141))))

(assert (=> b!452957 (= res!269855 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13837 _keys!709))))))

(declare-fun b!452958 () Bool)

(assert (=> b!452958 (= e!265140 (and e!265144 mapRes!19842))))

(declare-fun condMapEmpty!19842 () Bool)

(declare-fun mapDefault!19842 () ValueCell!5725)

