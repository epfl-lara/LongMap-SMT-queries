; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39846 () Bool)

(assert start!39846)

(declare-fun b_free!10113 () Bool)

(declare-fun b_next!10113 () Bool)

(assert (=> start!39846 (= b_free!10113 (not b_next!10113))))

(declare-fun tp!35867 () Bool)

(declare-fun b_and!17885 () Bool)

(assert (=> start!39846 (= tp!35867 b_and!17885)))

(declare-fun b!430704 () Bool)

(declare-fun e!254953 () Bool)

(declare-fun e!254955 () Bool)

(declare-fun mapRes!18519 () Bool)

(assert (=> b!430704 (= e!254953 (and e!254955 mapRes!18519))))

(declare-fun condMapEmpty!18519 () Bool)

(declare-datatypes ((V!16125 0))(
  ( (V!16126 (val!5677 Int)) )
))
(declare-datatypes ((ValueCell!5289 0))(
  ( (ValueCellFull!5289 (v!7924 V!16125)) (EmptyCell!5289) )
))
(declare-datatypes ((array!26365 0))(
  ( (array!26366 (arr!12632 (Array (_ BitVec 32) ValueCell!5289)) (size!12984 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26365)

(declare-fun mapDefault!18519 () ValueCell!5289)

(assert (=> b!430704 (= condMapEmpty!18519 (= (arr!12632 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5289)) mapDefault!18519)))))

(declare-fun b!430705 () Bool)

(declare-fun res!253124 () Bool)

(declare-fun e!254960 () Bool)

(assert (=> b!430705 (=> (not res!253124) (not e!254960))))

(declare-datatypes ((array!26367 0))(
  ( (array!26368 (arr!12633 (Array (_ BitVec 32) (_ BitVec 64))) (size!12985 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26367)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!430705 (= res!253124 (and (= (size!12984 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12985 _keys!709) (size!12984 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!18519 () Bool)

(declare-fun tp!35868 () Bool)

(declare-fun e!254952 () Bool)

(assert (=> mapNonEmpty!18519 (= mapRes!18519 (and tp!35868 e!254952))))

(declare-fun mapRest!18519 () (Array (_ BitVec 32) ValueCell!5289))

(declare-fun mapKey!18519 () (_ BitVec 32))

(declare-fun mapValue!18519 () ValueCell!5289)

(assert (=> mapNonEmpty!18519 (= (arr!12632 _values!549) (store mapRest!18519 mapKey!18519 mapValue!18519))))

(declare-fun b!430706 () Bool)

(declare-datatypes ((Unit!12683 0))(
  ( (Unit!12684) )
))
(declare-fun e!254957 () Unit!12683)

(declare-fun Unit!12685 () Unit!12683)

(assert (=> b!430706 (= e!254957 Unit!12685)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!197057 () Unit!12683)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26367 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12683)

(assert (=> b!430706 (= lt!197057 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!430706 false))

(declare-fun b!430707 () Bool)

(declare-fun res!253123 () Bool)

(assert (=> b!430707 (=> (not res!253123) (not e!254960))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!430707 (= res!253123 (validMask!0 mask!1025))))

(declare-fun res!253117 () Bool)

(assert (=> start!39846 (=> (not res!253117) (not e!254960))))

(assert (=> start!39846 (= res!253117 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12985 _keys!709))))))

(assert (=> start!39846 e!254960))

(declare-fun tp_is_empty!11265 () Bool)

(assert (=> start!39846 tp_is_empty!11265))

(assert (=> start!39846 tp!35867))

(assert (=> start!39846 true))

(declare-fun array_inv!9198 (array!26365) Bool)

(assert (=> start!39846 (and (array_inv!9198 _values!549) e!254953)))

(declare-fun array_inv!9199 (array!26367) Bool)

(assert (=> start!39846 (array_inv!9199 _keys!709)))

(declare-fun b!430708 () Bool)

(declare-fun Unit!12686 () Unit!12683)

(assert (=> b!430708 (= e!254957 Unit!12686)))

(declare-fun b!430709 () Bool)

(declare-fun e!254954 () Bool)

(assert (=> b!430709 (= e!254960 e!254954)))

(declare-fun res!253120 () Bool)

(assert (=> b!430709 (=> (not res!253120) (not e!254954))))

(declare-fun lt!197052 () array!26367)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26367 (_ BitVec 32)) Bool)

(assert (=> b!430709 (= res!253120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!197052 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!430709 (= lt!197052 (array!26368 (store (arr!12633 _keys!709) i!563 k0!794) (size!12985 _keys!709)))))

(declare-fun b!430710 () Bool)

(declare-fun res!253114 () Bool)

(assert (=> b!430710 (=> (not res!253114) (not e!254954))))

(assert (=> b!430710 (= res!253114 (bvsle from!863 i!563))))

(declare-fun b!430711 () Bool)

(declare-fun res!253118 () Bool)

(assert (=> b!430711 (=> (not res!253118) (not e!254960))))

(assert (=> b!430711 (= res!253118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!430712 () Bool)

(assert (=> b!430712 (= e!254955 tp_is_empty!11265)))

(declare-fun b!430713 () Bool)

(assert (=> b!430713 (= e!254952 tp_is_empty!11265)))

(declare-fun b!430714 () Bool)

(declare-fun res!253115 () Bool)

(assert (=> b!430714 (=> (not res!253115) (not e!254960))))

(assert (=> b!430714 (= res!253115 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12985 _keys!709))))))

(declare-fun b!430715 () Bool)

(declare-fun res!253111 () Bool)

(assert (=> b!430715 (=> (not res!253111) (not e!254960))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!430715 (= res!253111 (validKeyInArray!0 k0!794))))

(declare-fun b!430716 () Bool)

(declare-fun e!254961 () Bool)

(assert (=> b!430716 (= e!254954 e!254961)))

(declare-fun res!253112 () Bool)

(assert (=> b!430716 (=> (not res!253112) (not e!254961))))

(assert (=> b!430716 (= res!253112 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16125)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7480 0))(
  ( (tuple2!7481 (_1!3751 (_ BitVec 64)) (_2!3751 V!16125)) )
))
(declare-datatypes ((List!7498 0))(
  ( (Nil!7495) (Cons!7494 (h!8350 tuple2!7480) (t!13060 List!7498)) )
))
(declare-datatypes ((ListLongMap!6393 0))(
  ( (ListLongMap!6394 (toList!3212 List!7498)) )
))
(declare-fun lt!197054 () ListLongMap!6393)

(declare-fun lt!197053 () array!26365)

(declare-fun zeroValue!515 () V!16125)

(declare-fun getCurrentListMapNoExtraKeys!1413 (array!26367 array!26365 (_ BitVec 32) (_ BitVec 32) V!16125 V!16125 (_ BitVec 32) Int) ListLongMap!6393)

(assert (=> b!430716 (= lt!197054 (getCurrentListMapNoExtraKeys!1413 lt!197052 lt!197053 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16125)

(assert (=> b!430716 (= lt!197053 (array!26366 (store (arr!12632 _values!549) i!563 (ValueCellFull!5289 v!412)) (size!12984 _values!549)))))

(declare-fun lt!197051 () ListLongMap!6393)

(assert (=> b!430716 (= lt!197051 (getCurrentListMapNoExtraKeys!1413 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!430717 () Bool)

(declare-fun e!254958 () Bool)

(assert (=> b!430717 (= e!254958 true)))

(declare-fun lt!197050 () ListLongMap!6393)

(declare-fun lt!197056 () tuple2!7480)

(declare-fun lt!197059 () tuple2!7480)

(declare-fun lt!197047 () ListLongMap!6393)

(declare-fun +!1361 (ListLongMap!6393 tuple2!7480) ListLongMap!6393)

(assert (=> b!430717 (= lt!197050 (+!1361 (+!1361 lt!197047 lt!197056) lt!197059))))

(declare-fun lt!197046 () V!16125)

(declare-fun lt!197060 () Unit!12683)

(declare-fun addCommutativeForDiffKeys!356 (ListLongMap!6393 (_ BitVec 64) V!16125 (_ BitVec 64) V!16125) Unit!12683)

(assert (=> b!430717 (= lt!197060 (addCommutativeForDiffKeys!356 lt!197047 k0!794 v!412 (select (arr!12633 _keys!709) from!863) lt!197046))))

(declare-fun b!430718 () Bool)

(declare-fun res!253122 () Bool)

(assert (=> b!430718 (=> (not res!253122) (not e!254954))))

(declare-datatypes ((List!7499 0))(
  ( (Nil!7496) (Cons!7495 (h!8351 (_ BitVec 64)) (t!13061 List!7499)) )
))
(declare-fun arrayNoDuplicates!0 (array!26367 (_ BitVec 32) List!7499) Bool)

(assert (=> b!430718 (= res!253122 (arrayNoDuplicates!0 lt!197052 #b00000000000000000000000000000000 Nil!7496))))

(declare-fun mapIsEmpty!18519 () Bool)

(assert (=> mapIsEmpty!18519 mapRes!18519))

(declare-fun b!430719 () Bool)

(declare-fun e!254956 () Bool)

(assert (=> b!430719 (= e!254956 e!254958)))

(declare-fun res!253113 () Bool)

(assert (=> b!430719 (=> res!253113 e!254958)))

(assert (=> b!430719 (= res!253113 (= k0!794 (select (arr!12633 _keys!709) from!863)))))

(assert (=> b!430719 (not (= (select (arr!12633 _keys!709) from!863) k0!794))))

(declare-fun lt!197058 () Unit!12683)

(assert (=> b!430719 (= lt!197058 e!254957)))

(declare-fun c!55505 () Bool)

(assert (=> b!430719 (= c!55505 (= (select (arr!12633 _keys!709) from!863) k0!794))))

(assert (=> b!430719 (= lt!197054 lt!197050)))

(declare-fun lt!197049 () ListLongMap!6393)

(assert (=> b!430719 (= lt!197050 (+!1361 lt!197049 lt!197056))))

(assert (=> b!430719 (= lt!197056 (tuple2!7481 (select (arr!12633 _keys!709) from!863) lt!197046))))

(declare-fun get!6270 (ValueCell!5289 V!16125) V!16125)

(declare-fun dynLambda!785 (Int (_ BitVec 64)) V!16125)

(assert (=> b!430719 (= lt!197046 (get!6270 (select (arr!12632 _values!549) from!863) (dynLambda!785 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430720 () Bool)

(declare-fun res!253125 () Bool)

(assert (=> b!430720 (=> (not res!253125) (not e!254960))))

(assert (=> b!430720 (= res!253125 (or (= (select (arr!12633 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12633 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430721 () Bool)

(declare-fun res!253121 () Bool)

(assert (=> b!430721 (=> (not res!253121) (not e!254960))))

(assert (=> b!430721 (= res!253121 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7496))))

(declare-fun b!430722 () Bool)

(declare-fun res!253116 () Bool)

(assert (=> b!430722 (=> (not res!253116) (not e!254960))))

(declare-fun arrayContainsKey!0 (array!26367 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!430722 (= res!253116 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!430723 () Bool)

(assert (=> b!430723 (= e!254961 (not e!254956))))

(declare-fun res!253119 () Bool)

(assert (=> b!430723 (=> res!253119 e!254956)))

(assert (=> b!430723 (= res!253119 (not (validKeyInArray!0 (select (arr!12633 _keys!709) from!863))))))

(declare-fun lt!197048 () ListLongMap!6393)

(assert (=> b!430723 (= lt!197048 lt!197049)))

(assert (=> b!430723 (= lt!197049 (+!1361 lt!197047 lt!197059))))

(assert (=> b!430723 (= lt!197048 (getCurrentListMapNoExtraKeys!1413 lt!197052 lt!197053 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!430723 (= lt!197059 (tuple2!7481 k0!794 v!412))))

(assert (=> b!430723 (= lt!197047 (getCurrentListMapNoExtraKeys!1413 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!197055 () Unit!12683)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!549 (array!26367 array!26365 (_ BitVec 32) (_ BitVec 32) V!16125 V!16125 (_ BitVec 32) (_ BitVec 64) V!16125 (_ BitVec 32) Int) Unit!12683)

(assert (=> b!430723 (= lt!197055 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!549 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!39846 res!253117) b!430707))

(assert (= (and b!430707 res!253123) b!430705))

(assert (= (and b!430705 res!253124) b!430711))

(assert (= (and b!430711 res!253118) b!430721))

(assert (= (and b!430721 res!253121) b!430714))

(assert (= (and b!430714 res!253115) b!430715))

(assert (= (and b!430715 res!253111) b!430720))

(assert (= (and b!430720 res!253125) b!430722))

(assert (= (and b!430722 res!253116) b!430709))

(assert (= (and b!430709 res!253120) b!430718))

(assert (= (and b!430718 res!253122) b!430710))

(assert (= (and b!430710 res!253114) b!430716))

(assert (= (and b!430716 res!253112) b!430723))

(assert (= (and b!430723 (not res!253119)) b!430719))

(assert (= (and b!430719 c!55505) b!430706))

(assert (= (and b!430719 (not c!55505)) b!430708))

(assert (= (and b!430719 (not res!253113)) b!430717))

(assert (= (and b!430704 condMapEmpty!18519) mapIsEmpty!18519))

(assert (= (and b!430704 (not condMapEmpty!18519)) mapNonEmpty!18519))

(get-info :version)

(assert (= (and mapNonEmpty!18519 ((_ is ValueCellFull!5289) mapValue!18519)) b!430713))

(assert (= (and b!430704 ((_ is ValueCellFull!5289) mapDefault!18519)) b!430712))

(assert (= start!39846 b!430704))

(declare-fun b_lambda!9201 () Bool)

(assert (=> (not b_lambda!9201) (not b!430719)))

(declare-fun t!13059 () Bool)

(declare-fun tb!3519 () Bool)

(assert (=> (and start!39846 (= defaultEntry!557 defaultEntry!557) t!13059) tb!3519))

(declare-fun result!6565 () Bool)

(assert (=> tb!3519 (= result!6565 tp_is_empty!11265)))

(assert (=> b!430719 t!13059))

(declare-fun b_and!17887 () Bool)

(assert (= b_and!17885 (and (=> t!13059 result!6565) b_and!17887)))

(declare-fun m!418897 () Bool)

(assert (=> b!430718 m!418897))

(declare-fun m!418899 () Bool)

(assert (=> b!430719 m!418899))

(declare-fun m!418901 () Bool)

(assert (=> b!430719 m!418901))

(declare-fun m!418903 () Bool)

(assert (=> b!430719 m!418903))

(declare-fun m!418905 () Bool)

(assert (=> b!430719 m!418905))

(assert (=> b!430719 m!418903))

(assert (=> b!430719 m!418901))

(declare-fun m!418907 () Bool)

(assert (=> b!430719 m!418907))

(assert (=> b!430723 m!418899))

(declare-fun m!418909 () Bool)

(assert (=> b!430723 m!418909))

(declare-fun m!418911 () Bool)

(assert (=> b!430723 m!418911))

(assert (=> b!430723 m!418899))

(declare-fun m!418913 () Bool)

(assert (=> b!430723 m!418913))

(declare-fun m!418915 () Bool)

(assert (=> b!430723 m!418915))

(declare-fun m!418917 () Bool)

(assert (=> b!430723 m!418917))

(declare-fun m!418919 () Bool)

(assert (=> b!430707 m!418919))

(declare-fun m!418921 () Bool)

(assert (=> b!430721 m!418921))

(declare-fun m!418923 () Bool)

(assert (=> mapNonEmpty!18519 m!418923))

(declare-fun m!418925 () Bool)

(assert (=> b!430717 m!418925))

(assert (=> b!430717 m!418925))

(declare-fun m!418927 () Bool)

(assert (=> b!430717 m!418927))

(assert (=> b!430717 m!418899))

(assert (=> b!430717 m!418899))

(declare-fun m!418929 () Bool)

(assert (=> b!430717 m!418929))

(declare-fun m!418931 () Bool)

(assert (=> b!430715 m!418931))

(declare-fun m!418933 () Bool)

(assert (=> b!430706 m!418933))

(declare-fun m!418935 () Bool)

(assert (=> b!430716 m!418935))

(declare-fun m!418937 () Bool)

(assert (=> b!430716 m!418937))

(declare-fun m!418939 () Bool)

(assert (=> b!430716 m!418939))

(declare-fun m!418941 () Bool)

(assert (=> b!430709 m!418941))

(declare-fun m!418943 () Bool)

(assert (=> b!430709 m!418943))

(declare-fun m!418945 () Bool)

(assert (=> b!430720 m!418945))

(declare-fun m!418947 () Bool)

(assert (=> b!430722 m!418947))

(declare-fun m!418949 () Bool)

(assert (=> start!39846 m!418949))

(declare-fun m!418951 () Bool)

(assert (=> start!39846 m!418951))

(declare-fun m!418953 () Bool)

(assert (=> b!430711 m!418953))

(check-sat b_and!17887 (not b!430715) (not b!430706) (not mapNonEmpty!18519) (not b!430716) (not b!430718) (not b!430709) (not b_next!10113) (not b!430721) (not b!430707) (not b_lambda!9201) (not b!430717) (not b!430722) (not b!430723) (not start!39846) (not b!430711) tp_is_empty!11265 (not b!430719))
(check-sat b_and!17887 (not b_next!10113))
