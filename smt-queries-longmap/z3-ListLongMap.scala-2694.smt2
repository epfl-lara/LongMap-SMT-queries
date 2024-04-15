; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39968 () Bool)

(assert start!39968)

(declare-fun b_free!10249 () Bool)

(declare-fun b_next!10249 () Bool)

(assert (=> start!39968 (= b_free!10249 (not b_next!10249))))

(declare-fun tp!36275 () Bool)

(declare-fun b_and!18131 () Bool)

(assert (=> start!39968 (= tp!36275 b_and!18131)))

(declare-fun b!434649 () Bool)

(declare-fun e!256825 () Bool)

(declare-fun e!256824 () Bool)

(assert (=> b!434649 (= e!256825 e!256824)))

(declare-fun res!256047 () Bool)

(assert (=> b!434649 (=> (not res!256047) (not e!256824))))

(declare-datatypes ((array!26625 0))(
  ( (array!26626 (arr!12762 (Array (_ BitVec 32) (_ BitVec 64))) (size!13115 (_ BitVec 32))) )
))
(declare-fun lt!199883 () array!26625)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26625 (_ BitVec 32)) Bool)

(assert (=> b!434649 (= res!256047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!199883 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun _keys!709 () array!26625)

(assert (=> b!434649 (= lt!199883 (array!26626 (store (arr!12762 _keys!709) i!563 k0!794) (size!13115 _keys!709)))))

(declare-fun b!434650 () Bool)

(declare-fun res!256052 () Bool)

(assert (=> b!434650 (=> (not res!256052) (not e!256825))))

(declare-datatypes ((List!7601 0))(
  ( (Nil!7598) (Cons!7597 (h!8453 (_ BitVec 64)) (t!13290 List!7601)) )
))
(declare-fun arrayNoDuplicates!0 (array!26625 (_ BitVec 32) List!7601) Bool)

(assert (=> b!434650 (= res!256052 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7598))))

(declare-fun b!434651 () Bool)

(declare-fun res!256055 () Bool)

(assert (=> b!434651 (=> (not res!256055) (not e!256825))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!434651 (= res!256055 (validMask!0 mask!1025))))

(declare-fun b!434652 () Bool)

(declare-fun res!256046 () Bool)

(assert (=> b!434652 (=> (not res!256046) (not e!256825))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!434652 (= res!256046 (validKeyInArray!0 k0!794))))

(declare-fun b!434654 () Bool)

(declare-fun res!256043 () Bool)

(assert (=> b!434654 (=> (not res!256043) (not e!256825))))

(assert (=> b!434654 (= res!256043 (or (= (select (arr!12762 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12762 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!434655 () Bool)

(declare-datatypes ((Unit!12871 0))(
  ( (Unit!12872) )
))
(declare-fun e!256820 () Unit!12871)

(declare-fun Unit!12873 () Unit!12871)

(assert (=> b!434655 (= e!256820 Unit!12873)))

(declare-fun lt!199881 () Unit!12871)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26625 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12871)

(assert (=> b!434655 (= lt!199881 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!434655 false))

(declare-fun mapIsEmpty!18723 () Bool)

(declare-fun mapRes!18723 () Bool)

(assert (=> mapIsEmpty!18723 mapRes!18723))

(declare-fun b!434656 () Bool)

(declare-fun res!256050 () Bool)

(assert (=> b!434656 (=> (not res!256050) (not e!256824))))

(assert (=> b!434656 (= res!256050 (bvsle from!863 i!563))))

(declare-fun b!434657 () Bool)

(declare-fun e!256826 () Bool)

(declare-fun e!256819 () Bool)

(assert (=> b!434657 (= e!256826 e!256819)))

(declare-fun res!256044 () Bool)

(assert (=> b!434657 (=> res!256044 e!256819)))

(assert (=> b!434657 (= res!256044 (= k0!794 (select (arr!12762 _keys!709) from!863)))))

(assert (=> b!434657 (not (= (select (arr!12762 _keys!709) from!863) k0!794))))

(declare-fun lt!199875 () Unit!12871)

(assert (=> b!434657 (= lt!199875 e!256820)))

(declare-fun c!55638 () Bool)

(assert (=> b!434657 (= c!55638 (= (select (arr!12762 _keys!709) from!863) k0!794))))

(declare-datatypes ((V!16307 0))(
  ( (V!16308 (val!5745 Int)) )
))
(declare-datatypes ((tuple2!7612 0))(
  ( (tuple2!7613 (_1!3817 (_ BitVec 64)) (_2!3817 V!16307)) )
))
(declare-datatypes ((List!7602 0))(
  ( (Nil!7599) (Cons!7598 (h!8454 tuple2!7612) (t!13291 List!7602)) )
))
(declare-datatypes ((ListLongMap!6515 0))(
  ( (ListLongMap!6516 (toList!3273 List!7602)) )
))
(declare-fun lt!199876 () ListLongMap!6515)

(declare-fun lt!199880 () ListLongMap!6515)

(assert (=> b!434657 (= lt!199876 lt!199880)))

(declare-fun lt!199878 () ListLongMap!6515)

(declare-fun lt!199877 () tuple2!7612)

(declare-fun +!1448 (ListLongMap!6515 tuple2!7612) ListLongMap!6515)

(assert (=> b!434657 (= lt!199880 (+!1448 lt!199878 lt!199877))))

(declare-fun lt!199886 () V!16307)

(assert (=> b!434657 (= lt!199877 (tuple2!7613 (select (arr!12762 _keys!709) from!863) lt!199886))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5357 0))(
  ( (ValueCellFull!5357 (v!7986 V!16307)) (EmptyCell!5357) )
))
(declare-datatypes ((array!26627 0))(
  ( (array!26628 (arr!12763 (Array (_ BitVec 32) ValueCell!5357)) (size!13116 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26627)

(declare-fun get!6360 (ValueCell!5357 V!16307) V!16307)

(declare-fun dynLambda!826 (Int (_ BitVec 64)) V!16307)

(assert (=> b!434657 (= lt!199886 (get!6360 (select (arr!12763 _values!549) from!863) (dynLambda!826 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!434658 () Bool)

(declare-fun res!256045 () Bool)

(assert (=> b!434658 (=> (not res!256045) (not e!256825))))

(assert (=> b!434658 (= res!256045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!434659 () Bool)

(declare-fun res!256042 () Bool)

(assert (=> b!434659 (=> (not res!256042) (not e!256824))))

(assert (=> b!434659 (= res!256042 (arrayNoDuplicates!0 lt!199883 #b00000000000000000000000000000000 Nil!7598))))

(declare-fun b!434660 () Bool)

(declare-fun e!256827 () Bool)

(declare-fun tp_is_empty!11401 () Bool)

(assert (=> b!434660 (= e!256827 tp_is_empty!11401)))

(declare-fun b!434661 () Bool)

(declare-fun res!256049 () Bool)

(assert (=> b!434661 (=> (not res!256049) (not e!256825))))

(assert (=> b!434661 (= res!256049 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13115 _keys!709))))))

(declare-fun b!434662 () Bool)

(declare-fun e!256821 () Bool)

(declare-fun e!256822 () Bool)

(assert (=> b!434662 (= e!256821 (and e!256822 mapRes!18723))))

(declare-fun condMapEmpty!18723 () Bool)

(declare-fun mapDefault!18723 () ValueCell!5357)

(assert (=> b!434662 (= condMapEmpty!18723 (= (arr!12763 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5357)) mapDefault!18723)))))

(declare-fun b!434653 () Bool)

(declare-fun e!256818 () Bool)

(assert (=> b!434653 (= e!256824 e!256818)))

(declare-fun res!256051 () Bool)

(assert (=> b!434653 (=> (not res!256051) (not e!256818))))

(assert (=> b!434653 (= res!256051 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16307)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!199874 () array!26627)

(declare-fun zeroValue!515 () V!16307)

(declare-fun getCurrentListMapNoExtraKeys!1475 (array!26625 array!26627 (_ BitVec 32) (_ BitVec 32) V!16307 V!16307 (_ BitVec 32) Int) ListLongMap!6515)

(assert (=> b!434653 (= lt!199876 (getCurrentListMapNoExtraKeys!1475 lt!199883 lt!199874 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16307)

(assert (=> b!434653 (= lt!199874 (array!26628 (store (arr!12763 _values!549) i!563 (ValueCellFull!5357 v!412)) (size!13116 _values!549)))))

(declare-fun lt!199882 () ListLongMap!6515)

(assert (=> b!434653 (= lt!199882 (getCurrentListMapNoExtraKeys!1475 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!256056 () Bool)

(assert (=> start!39968 (=> (not res!256056) (not e!256825))))

(assert (=> start!39968 (= res!256056 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13115 _keys!709))))))

(assert (=> start!39968 e!256825))

(assert (=> start!39968 tp_is_empty!11401))

(assert (=> start!39968 tp!36275))

(assert (=> start!39968 true))

(declare-fun array_inv!9314 (array!26627) Bool)

(assert (=> start!39968 (and (array_inv!9314 _values!549) e!256821)))

(declare-fun array_inv!9315 (array!26625) Bool)

(assert (=> start!39968 (array_inv!9315 _keys!709)))

(declare-fun b!434663 () Bool)

(assert (=> b!434663 (= e!256819 true)))

(declare-fun lt!199872 () ListLongMap!6515)

(declare-fun lt!199884 () tuple2!7612)

(assert (=> b!434663 (= lt!199880 (+!1448 (+!1448 lt!199872 lt!199877) lt!199884))))

(declare-fun lt!199873 () Unit!12871)

(declare-fun addCommutativeForDiffKeys!401 (ListLongMap!6515 (_ BitVec 64) V!16307 (_ BitVec 64) V!16307) Unit!12871)

(assert (=> b!434663 (= lt!199873 (addCommutativeForDiffKeys!401 lt!199872 k0!794 v!412 (select (arr!12762 _keys!709) from!863) lt!199886))))

(declare-fun mapNonEmpty!18723 () Bool)

(declare-fun tp!36276 () Bool)

(assert (=> mapNonEmpty!18723 (= mapRes!18723 (and tp!36276 e!256827))))

(declare-fun mapValue!18723 () ValueCell!5357)

(declare-fun mapRest!18723 () (Array (_ BitVec 32) ValueCell!5357))

(declare-fun mapKey!18723 () (_ BitVec 32))

(assert (=> mapNonEmpty!18723 (= (arr!12763 _values!549) (store mapRest!18723 mapKey!18723 mapValue!18723))))

(declare-fun b!434664 () Bool)

(assert (=> b!434664 (= e!256822 tp_is_empty!11401)))

(declare-fun b!434665 () Bool)

(declare-fun res!256048 () Bool)

(assert (=> b!434665 (=> (not res!256048) (not e!256825))))

(declare-fun arrayContainsKey!0 (array!26625 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!434665 (= res!256048 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!434666 () Bool)

(declare-fun Unit!12874 () Unit!12871)

(assert (=> b!434666 (= e!256820 Unit!12874)))

(declare-fun b!434667 () Bool)

(assert (=> b!434667 (= e!256818 (not e!256826))))

(declare-fun res!256053 () Bool)

(assert (=> b!434667 (=> res!256053 e!256826)))

(assert (=> b!434667 (= res!256053 (not (validKeyInArray!0 (select (arr!12762 _keys!709) from!863))))))

(declare-fun lt!199879 () ListLongMap!6515)

(assert (=> b!434667 (= lt!199879 lt!199878)))

(assert (=> b!434667 (= lt!199878 (+!1448 lt!199872 lt!199884))))

(assert (=> b!434667 (= lt!199879 (getCurrentListMapNoExtraKeys!1475 lt!199883 lt!199874 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!434667 (= lt!199884 (tuple2!7613 k0!794 v!412))))

(assert (=> b!434667 (= lt!199872 (getCurrentListMapNoExtraKeys!1475 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!199885 () Unit!12871)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!594 (array!26625 array!26627 (_ BitVec 32) (_ BitVec 32) V!16307 V!16307 (_ BitVec 32) (_ BitVec 64) V!16307 (_ BitVec 32) Int) Unit!12871)

(assert (=> b!434667 (= lt!199885 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!594 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!434668 () Bool)

(declare-fun res!256054 () Bool)

(assert (=> b!434668 (=> (not res!256054) (not e!256825))))

(assert (=> b!434668 (= res!256054 (and (= (size!13116 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13115 _keys!709) (size!13116 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!39968 res!256056) b!434651))

(assert (= (and b!434651 res!256055) b!434668))

(assert (= (and b!434668 res!256054) b!434658))

(assert (= (and b!434658 res!256045) b!434650))

(assert (= (and b!434650 res!256052) b!434661))

(assert (= (and b!434661 res!256049) b!434652))

(assert (= (and b!434652 res!256046) b!434654))

(assert (= (and b!434654 res!256043) b!434665))

(assert (= (and b!434665 res!256048) b!434649))

(assert (= (and b!434649 res!256047) b!434659))

(assert (= (and b!434659 res!256042) b!434656))

(assert (= (and b!434656 res!256050) b!434653))

(assert (= (and b!434653 res!256051) b!434667))

(assert (= (and b!434667 (not res!256053)) b!434657))

(assert (= (and b!434657 c!55638) b!434655))

(assert (= (and b!434657 (not c!55638)) b!434666))

(assert (= (and b!434657 (not res!256044)) b!434663))

(assert (= (and b!434662 condMapEmpty!18723) mapIsEmpty!18723))

(assert (= (and b!434662 (not condMapEmpty!18723)) mapNonEmpty!18723))

(get-info :version)

(assert (= (and mapNonEmpty!18723 ((_ is ValueCellFull!5357) mapValue!18723)) b!434660))

(assert (= (and b!434662 ((_ is ValueCellFull!5357) mapDefault!18723)) b!434664))

(assert (= start!39968 b!434662))

(declare-fun b_lambda!9319 () Bool)

(assert (=> (not b_lambda!9319) (not b!434657)))

(declare-fun t!13289 () Bool)

(declare-fun tb!3647 () Bool)

(assert (=> (and start!39968 (= defaultEntry!557 defaultEntry!557) t!13289) tb!3647))

(declare-fun result!6829 () Bool)

(assert (=> tb!3647 (= result!6829 tp_is_empty!11401)))

(assert (=> b!434657 t!13289))

(declare-fun b_and!18133 () Bool)

(assert (= b_and!18131 (and (=> t!13289 result!6829) b_and!18133)))

(declare-fun m!422109 () Bool)

(assert (=> b!434652 m!422109))

(declare-fun m!422111 () Bool)

(assert (=> b!434655 m!422111))

(declare-fun m!422113 () Bool)

(assert (=> mapNonEmpty!18723 m!422113))

(declare-fun m!422115 () Bool)

(assert (=> b!434649 m!422115))

(declare-fun m!422117 () Bool)

(assert (=> b!434649 m!422117))

(declare-fun m!422119 () Bool)

(assert (=> b!434653 m!422119))

(declare-fun m!422121 () Bool)

(assert (=> b!434653 m!422121))

(declare-fun m!422123 () Bool)

(assert (=> b!434653 m!422123))

(declare-fun m!422125 () Bool)

(assert (=> b!434657 m!422125))

(declare-fun m!422127 () Bool)

(assert (=> b!434657 m!422127))

(declare-fun m!422129 () Bool)

(assert (=> b!434657 m!422129))

(declare-fun m!422131 () Bool)

(assert (=> b!434657 m!422131))

(assert (=> b!434657 m!422131))

(assert (=> b!434657 m!422129))

(declare-fun m!422133 () Bool)

(assert (=> b!434657 m!422133))

(declare-fun m!422135 () Bool)

(assert (=> start!39968 m!422135))

(declare-fun m!422137 () Bool)

(assert (=> start!39968 m!422137))

(declare-fun m!422139 () Bool)

(assert (=> b!434663 m!422139))

(assert (=> b!434663 m!422139))

(declare-fun m!422141 () Bool)

(assert (=> b!434663 m!422141))

(assert (=> b!434663 m!422125))

(assert (=> b!434663 m!422125))

(declare-fun m!422143 () Bool)

(assert (=> b!434663 m!422143))

(declare-fun m!422145 () Bool)

(assert (=> b!434650 m!422145))

(declare-fun m!422147 () Bool)

(assert (=> b!434654 m!422147))

(declare-fun m!422149 () Bool)

(assert (=> b!434659 m!422149))

(declare-fun m!422151 () Bool)

(assert (=> b!434658 m!422151))

(declare-fun m!422153 () Bool)

(assert (=> b!434651 m!422153))

(declare-fun m!422155 () Bool)

(assert (=> b!434665 m!422155))

(assert (=> b!434667 m!422125))

(declare-fun m!422157 () Bool)

(assert (=> b!434667 m!422157))

(declare-fun m!422159 () Bool)

(assert (=> b!434667 m!422159))

(declare-fun m!422161 () Bool)

(assert (=> b!434667 m!422161))

(assert (=> b!434667 m!422125))

(declare-fun m!422163 () Bool)

(assert (=> b!434667 m!422163))

(declare-fun m!422165 () Bool)

(assert (=> b!434667 m!422165))

(check-sat (not b!434657) (not b_next!10249) tp_is_empty!11401 (not b!434665) (not b_lambda!9319) (not b!434651) (not b!434649) (not b!434659) (not b!434652) (not b!434653) (not b!434650) (not start!39968) (not b!434658) (not b!434663) (not b!434667) (not mapNonEmpty!18723) (not b!434655) b_and!18133)
(check-sat b_and!18133 (not b_next!10249))
