; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38562 () Bool)

(assert start!38562)

(declare-fun b_free!9099 () Bool)

(declare-fun b_next!9099 () Bool)

(assert (=> start!38562 (= b_free!9099 (not b_next!9099))))

(declare-fun tp!32420 () Bool)

(declare-fun b_and!16485 () Bool)

(assert (=> start!38562 (= tp!32420 b_and!16485)))

(declare-fun b!398983 () Bool)

(declare-fun e!241041 () Bool)

(declare-fun e!241046 () Bool)

(declare-fun mapRes!16593 () Bool)

(assert (=> b!398983 (= e!241041 (and e!241046 mapRes!16593))))

(declare-fun condMapEmpty!16593 () Bool)

(declare-datatypes ((V!14413 0))(
  ( (V!14414 (val!5035 Int)) )
))
(declare-datatypes ((ValueCell!4647 0))(
  ( (ValueCellFull!4647 (v!7282 V!14413)) (EmptyCell!4647) )
))
(declare-datatypes ((array!23873 0))(
  ( (array!23874 (arr!11386 (Array (_ BitVec 32) ValueCell!4647)) (size!11738 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23873)

(declare-fun mapDefault!16593 () ValueCell!4647)

(assert (=> b!398983 (= condMapEmpty!16593 (= (arr!11386 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4647)) mapDefault!16593)))))

(declare-fun c!54605 () Bool)

(declare-fun minValue!515 () V!14413)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun bm!27958 () Bool)

(declare-datatypes ((tuple2!6662 0))(
  ( (tuple2!6663 (_1!3342 (_ BitVec 64)) (_2!3342 V!14413)) )
))
(declare-datatypes ((List!6588 0))(
  ( (Nil!6585) (Cons!6584 (h!7440 tuple2!6662) (t!11762 List!6588)) )
))
(declare-datatypes ((ListLongMap!5575 0))(
  ( (ListLongMap!5576 (toList!2803 List!6588)) )
))
(declare-fun call!27962 () ListLongMap!5575)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!14413)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!23875 0))(
  ( (array!23876 (arr!11387 (Array (_ BitVec 32) (_ BitVec 64))) (size!11739 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23875)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!14413)

(declare-fun lt!187522 () array!23875)

(declare-fun getCurrentListMapNoExtraKeys!1021 (array!23875 array!23873 (_ BitVec 32) (_ BitVec 32) V!14413 V!14413 (_ BitVec 32) Int) ListLongMap!5575)

(assert (=> bm!27958 (= call!27962 (getCurrentListMapNoExtraKeys!1021 (ite c!54605 lt!187522 _keys!709) (ite c!54605 (array!23874 (store (arr!11386 _values!549) i!563 (ValueCellFull!4647 v!412)) (size!11738 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!398984 () Bool)

(declare-fun e!241043 () Bool)

(assert (=> b!398984 (= e!241043 (not true))))

(declare-fun e!241044 () Bool)

(assert (=> b!398984 e!241044))

(assert (=> b!398984 (= c!54605 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12092 0))(
  ( (Unit!12093) )
))
(declare-fun lt!187523 () Unit!12092)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!304 (array!23875 array!23873 (_ BitVec 32) (_ BitVec 32) V!14413 V!14413 (_ BitVec 32) (_ BitVec 64) V!14413 (_ BitVec 32) Int) Unit!12092)

(assert (=> b!398984 (= lt!187523 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!304 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!398985 () Bool)

(declare-fun e!241047 () Bool)

(declare-fun tp_is_empty!9981 () Bool)

(assert (=> b!398985 (= e!241047 tp_is_empty!9981)))

(declare-fun b!398986 () Bool)

(declare-fun e!241042 () Bool)

(assert (=> b!398986 (= e!241042 e!241043)))

(declare-fun res!229354 () Bool)

(assert (=> b!398986 (=> (not res!229354) (not e!241043))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23875 (_ BitVec 32)) Bool)

(assert (=> b!398986 (= res!229354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187522 mask!1025))))

(assert (=> b!398986 (= lt!187522 (array!23876 (store (arr!11387 _keys!709) i!563 k0!794) (size!11739 _keys!709)))))

(declare-fun b!398987 () Bool)

(declare-fun res!229358 () Bool)

(assert (=> b!398987 (=> (not res!229358) (not e!241042))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!398987 (= res!229358 (validKeyInArray!0 k0!794))))

(declare-fun bm!27959 () Bool)

(declare-fun call!27961 () ListLongMap!5575)

(assert (=> bm!27959 (= call!27961 (getCurrentListMapNoExtraKeys!1021 (ite c!54605 _keys!709 lt!187522) (ite c!54605 _values!549 (array!23874 (store (arr!11386 _values!549) i!563 (ValueCellFull!4647 v!412)) (size!11738 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!16593 () Bool)

(assert (=> mapIsEmpty!16593 mapRes!16593))

(declare-fun b!398988 () Bool)

(assert (=> b!398988 (= e!241046 tp_is_empty!9981)))

(declare-fun b!398989 () Bool)

(declare-fun res!229359 () Bool)

(assert (=> b!398989 (=> (not res!229359) (not e!241042))))

(declare-fun arrayContainsKey!0 (array!23875 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!398989 (= res!229359 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!229362 () Bool)

(assert (=> start!38562 (=> (not res!229362) (not e!241042))))

(assert (=> start!38562 (= res!229362 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11739 _keys!709))))))

(assert (=> start!38562 e!241042))

(assert (=> start!38562 tp_is_empty!9981))

(assert (=> start!38562 tp!32420))

(assert (=> start!38562 true))

(declare-fun array_inv!8344 (array!23873) Bool)

(assert (=> start!38562 (and (array_inv!8344 _values!549) e!241041)))

(declare-fun array_inv!8345 (array!23875) Bool)

(assert (=> start!38562 (array_inv!8345 _keys!709)))

(declare-fun b!398990 () Bool)

(declare-fun res!229364 () Bool)

(assert (=> b!398990 (=> (not res!229364) (not e!241042))))

(assert (=> b!398990 (= res!229364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!16593 () Bool)

(declare-fun tp!32421 () Bool)

(assert (=> mapNonEmpty!16593 (= mapRes!16593 (and tp!32421 e!241047))))

(declare-fun mapRest!16593 () (Array (_ BitVec 32) ValueCell!4647))

(declare-fun mapValue!16593 () ValueCell!4647)

(declare-fun mapKey!16593 () (_ BitVec 32))

(assert (=> mapNonEmpty!16593 (= (arr!11386 _values!549) (store mapRest!16593 mapKey!16593 mapValue!16593))))

(declare-fun b!398991 () Bool)

(declare-fun res!229360 () Bool)

(assert (=> b!398991 (=> (not res!229360) (not e!241043))))

(assert (=> b!398991 (= res!229360 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11739 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!398992 () Bool)

(declare-fun res!229361 () Bool)

(assert (=> b!398992 (=> (not res!229361) (not e!241042))))

(assert (=> b!398992 (= res!229361 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11739 _keys!709))))))

(declare-fun b!398993 () Bool)

(declare-fun res!229355 () Bool)

(assert (=> b!398993 (=> (not res!229355) (not e!241042))))

(assert (=> b!398993 (= res!229355 (or (= (select (arr!11387 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11387 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!398994 () Bool)

(declare-fun res!229357 () Bool)

(assert (=> b!398994 (=> (not res!229357) (not e!241043))))

(declare-datatypes ((List!6589 0))(
  ( (Nil!6586) (Cons!6585 (h!7441 (_ BitVec 64)) (t!11763 List!6589)) )
))
(declare-fun arrayNoDuplicates!0 (array!23875 (_ BitVec 32) List!6589) Bool)

(assert (=> b!398994 (= res!229357 (arrayNoDuplicates!0 lt!187522 #b00000000000000000000000000000000 Nil!6586))))

(declare-fun b!398995 () Bool)

(declare-fun res!229365 () Bool)

(assert (=> b!398995 (=> (not res!229365) (not e!241042))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!398995 (= res!229365 (validMask!0 mask!1025))))

(declare-fun b!398996 () Bool)

(declare-fun res!229363 () Bool)

(assert (=> b!398996 (=> (not res!229363) (not e!241042))))

(assert (=> b!398996 (= res!229363 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6586))))

(declare-fun b!398997 () Bool)

(assert (=> b!398997 (= e!241044 (= call!27961 call!27962))))

(declare-fun b!398998 () Bool)

(declare-fun res!229356 () Bool)

(assert (=> b!398998 (=> (not res!229356) (not e!241042))))

(assert (=> b!398998 (= res!229356 (and (= (size!11738 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11739 _keys!709) (size!11738 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!398999 () Bool)

(declare-fun +!1093 (ListLongMap!5575 tuple2!6662) ListLongMap!5575)

(assert (=> b!398999 (= e!241044 (= call!27962 (+!1093 call!27961 (tuple2!6663 k0!794 v!412))))))

(assert (= (and start!38562 res!229362) b!398995))

(assert (= (and b!398995 res!229365) b!398998))

(assert (= (and b!398998 res!229356) b!398990))

(assert (= (and b!398990 res!229364) b!398996))

(assert (= (and b!398996 res!229363) b!398992))

(assert (= (and b!398992 res!229361) b!398987))

(assert (= (and b!398987 res!229358) b!398993))

(assert (= (and b!398993 res!229355) b!398989))

(assert (= (and b!398989 res!229359) b!398986))

(assert (= (and b!398986 res!229354) b!398994))

(assert (= (and b!398994 res!229357) b!398991))

(assert (= (and b!398991 res!229360) b!398984))

(assert (= (and b!398984 c!54605) b!398999))

(assert (= (and b!398984 (not c!54605)) b!398997))

(assert (= (or b!398999 b!398997) bm!27958))

(assert (= (or b!398999 b!398997) bm!27959))

(assert (= (and b!398983 condMapEmpty!16593) mapIsEmpty!16593))

(assert (= (and b!398983 (not condMapEmpty!16593)) mapNonEmpty!16593))

(get-info :version)

(assert (= (and mapNonEmpty!16593 ((_ is ValueCellFull!4647) mapValue!16593)) b!398985))

(assert (= (and b!398983 ((_ is ValueCellFull!4647) mapDefault!16593)) b!398988))

(assert (= start!38562 b!398983))

(declare-fun m!393659 () Bool)

(assert (=> b!398990 m!393659))

(declare-fun m!393661 () Bool)

(assert (=> b!398993 m!393661))

(declare-fun m!393663 () Bool)

(assert (=> b!398987 m!393663))

(declare-fun m!393665 () Bool)

(assert (=> b!398984 m!393665))

(declare-fun m!393667 () Bool)

(assert (=> bm!27959 m!393667))

(declare-fun m!393669 () Bool)

(assert (=> bm!27959 m!393669))

(declare-fun m!393671 () Bool)

(assert (=> b!398986 m!393671))

(declare-fun m!393673 () Bool)

(assert (=> b!398986 m!393673))

(declare-fun m!393675 () Bool)

(assert (=> start!38562 m!393675))

(declare-fun m!393677 () Bool)

(assert (=> start!38562 m!393677))

(assert (=> bm!27958 m!393667))

(declare-fun m!393679 () Bool)

(assert (=> bm!27958 m!393679))

(declare-fun m!393681 () Bool)

(assert (=> b!398989 m!393681))

(declare-fun m!393683 () Bool)

(assert (=> b!398999 m!393683))

(declare-fun m!393685 () Bool)

(assert (=> b!398994 m!393685))

(declare-fun m!393687 () Bool)

(assert (=> mapNonEmpty!16593 m!393687))

(declare-fun m!393689 () Bool)

(assert (=> b!398996 m!393689))

(declare-fun m!393691 () Bool)

(assert (=> b!398995 m!393691))

(check-sat (not start!38562) (not b!398989) (not b!398995) (not b!398999) (not b!398990) (not b!398986) (not mapNonEmpty!16593) (not b!398987) (not b!398996) b_and!16485 (not b!398984) (not bm!27958) (not b!398994) (not bm!27959) (not b_next!9099) tp_is_empty!9981)
(check-sat b_and!16485 (not b_next!9099))
