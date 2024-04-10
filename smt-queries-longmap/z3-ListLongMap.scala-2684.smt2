; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39924 () Bool)

(assert start!39924)

(declare-fun b_free!10191 () Bool)

(declare-fun b_next!10191 () Bool)

(assert (=> start!39924 (= b_free!10191 (not b_next!10191))))

(declare-fun tp!36101 () Bool)

(declare-fun b_and!18041 () Bool)

(assert (=> start!39924 (= tp!36101 b_and!18041)))

(declare-fun b!433122 () Bool)

(declare-fun res!254867 () Bool)

(declare-fun e!256130 () Bool)

(assert (=> b!433122 (=> (not res!254867) (not e!256130))))

(declare-datatypes ((array!26519 0))(
  ( (array!26520 (arr!12709 (Array (_ BitVec 32) (_ BitVec 64))) (size!13061 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26519)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16229 0))(
  ( (V!16230 (val!5716 Int)) )
))
(declare-datatypes ((ValueCell!5328 0))(
  ( (ValueCellFull!5328 (v!7963 V!16229)) (EmptyCell!5328) )
))
(declare-datatypes ((array!26521 0))(
  ( (array!26522 (arr!12710 (Array (_ BitVec 32) ValueCell!5328)) (size!13062 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26521)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!433122 (= res!254867 (and (= (size!13062 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13061 _keys!709) (size!13062 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!433123 () Bool)

(declare-fun res!254880 () Bool)

(assert (=> b!433123 (=> (not res!254880) (not e!256130))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!433123 (= res!254880 (validMask!0 mask!1025))))

(declare-fun b!433124 () Bool)

(declare-datatypes ((Unit!12809 0))(
  ( (Unit!12810) )
))
(declare-fun e!256129 () Unit!12809)

(declare-fun Unit!12811 () Unit!12809)

(assert (=> b!433124 (= e!256129 Unit!12811)))

(declare-fun b!433125 () Bool)

(declare-fun res!254868 () Bool)

(assert (=> b!433125 (=> (not res!254868) (not e!256130))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!433125 (= res!254868 (validKeyInArray!0 k0!794))))

(declare-fun b!433126 () Bool)

(declare-fun e!256127 () Bool)

(declare-fun e!256122 () Bool)

(declare-fun mapRes!18636 () Bool)

(assert (=> b!433126 (= e!256127 (and e!256122 mapRes!18636))))

(declare-fun condMapEmpty!18636 () Bool)

(declare-fun mapDefault!18636 () ValueCell!5328)

(assert (=> b!433126 (= condMapEmpty!18636 (= (arr!12710 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5328)) mapDefault!18636)))))

(declare-fun b!433127 () Bool)

(declare-fun e!256128 () Bool)

(declare-fun e!256126 () Bool)

(assert (=> b!433127 (= e!256128 (not e!256126))))

(declare-fun res!254879 () Bool)

(assert (=> b!433127 (=> res!254879 e!256126)))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!433127 (= res!254879 (not (validKeyInArray!0 (select (arr!12709 _keys!709) from!863))))))

(declare-datatypes ((tuple2!7550 0))(
  ( (tuple2!7551 (_1!3786 (_ BitVec 64)) (_2!3786 V!16229)) )
))
(declare-datatypes ((List!7560 0))(
  ( (Nil!7557) (Cons!7556 (h!8412 tuple2!7550) (t!13200 List!7560)) )
))
(declare-datatypes ((ListLongMap!6463 0))(
  ( (ListLongMap!6464 (toList!3247 List!7560)) )
))
(declare-fun lt!198803 () ListLongMap!6463)

(declare-fun lt!198804 () ListLongMap!6463)

(assert (=> b!433127 (= lt!198803 lt!198804)))

(declare-fun lt!198808 () ListLongMap!6463)

(declare-fun lt!198812 () tuple2!7550)

(declare-fun +!1395 (ListLongMap!6463 tuple2!7550) ListLongMap!6463)

(assert (=> b!433127 (= lt!198804 (+!1395 lt!198808 lt!198812))))

(declare-fun minValue!515 () V!16229)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!198806 () array!26521)

(declare-fun zeroValue!515 () V!16229)

(declare-fun lt!198805 () array!26519)

(declare-fun getCurrentListMapNoExtraKeys!1443 (array!26519 array!26521 (_ BitVec 32) (_ BitVec 32) V!16229 V!16229 (_ BitVec 32) Int) ListLongMap!6463)

(assert (=> b!433127 (= lt!198803 (getCurrentListMapNoExtraKeys!1443 lt!198805 lt!198806 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun v!412 () V!16229)

(assert (=> b!433127 (= lt!198812 (tuple2!7551 k0!794 v!412))))

(assert (=> b!433127 (= lt!198808 (getCurrentListMapNoExtraKeys!1443 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lt!198802 () Unit!12809)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!576 (array!26519 array!26521 (_ BitVec 32) (_ BitVec 32) V!16229 V!16229 (_ BitVec 32) (_ BitVec 64) V!16229 (_ BitVec 32) Int) Unit!12809)

(assert (=> b!433127 (= lt!198802 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!576 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!433128 () Bool)

(declare-fun Unit!12812 () Unit!12809)

(assert (=> b!433128 (= e!256129 Unit!12812)))

(declare-fun lt!198809 () Unit!12809)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26519 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12809)

(assert (=> b!433128 (= lt!198809 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!433128 false))

(declare-fun b!433129 () Bool)

(declare-fun res!254877 () Bool)

(assert (=> b!433129 (=> (not res!254877) (not e!256130))))

(declare-datatypes ((List!7561 0))(
  ( (Nil!7558) (Cons!7557 (h!8413 (_ BitVec 64)) (t!13201 List!7561)) )
))
(declare-fun arrayNoDuplicates!0 (array!26519 (_ BitVec 32) List!7561) Bool)

(assert (=> b!433129 (= res!254877 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7558))))

(declare-fun res!254874 () Bool)

(assert (=> start!39924 (=> (not res!254874) (not e!256130))))

(assert (=> start!39924 (= res!254874 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13061 _keys!709))))))

(assert (=> start!39924 e!256130))

(declare-fun tp_is_empty!11343 () Bool)

(assert (=> start!39924 tp_is_empty!11343))

(assert (=> start!39924 tp!36101))

(assert (=> start!39924 true))

(declare-fun array_inv!9246 (array!26521) Bool)

(assert (=> start!39924 (and (array_inv!9246 _values!549) e!256127)))

(declare-fun array_inv!9247 (array!26519) Bool)

(assert (=> start!39924 (array_inv!9247 _keys!709)))

(declare-fun b!433130 () Bool)

(declare-fun e!256131 () Bool)

(assert (=> b!433130 (= e!256131 tp_is_empty!11343)))

(declare-fun b!433131 () Bool)

(declare-fun e!256125 () Bool)

(assert (=> b!433131 (= e!256126 e!256125)))

(declare-fun res!254878 () Bool)

(assert (=> b!433131 (=> res!254878 e!256125)))

(assert (=> b!433131 (= res!254878 (= k0!794 (select (arr!12709 _keys!709) from!863)))))

(assert (=> b!433131 (not (= (select (arr!12709 _keys!709) from!863) k0!794))))

(declare-fun lt!198801 () Unit!12809)

(assert (=> b!433131 (= lt!198801 e!256129)))

(declare-fun c!55622 () Bool)

(assert (=> b!433131 (= c!55622 (= (select (arr!12709 _keys!709) from!863) k0!794))))

(declare-fun lt!198810 () ListLongMap!6463)

(declare-fun lt!198813 () ListLongMap!6463)

(assert (=> b!433131 (= lt!198810 lt!198813)))

(declare-fun lt!198814 () tuple2!7550)

(assert (=> b!433131 (= lt!198813 (+!1395 lt!198804 lt!198814))))

(declare-fun lt!198807 () V!16229)

(assert (=> b!433131 (= lt!198814 (tuple2!7551 (select (arr!12709 _keys!709) from!863) lt!198807))))

(declare-fun get!6320 (ValueCell!5328 V!16229) V!16229)

(declare-fun dynLambda!809 (Int (_ BitVec 64)) V!16229)

(assert (=> b!433131 (= lt!198807 (get!6320 (select (arr!12710 _values!549) from!863) (dynLambda!809 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!433132 () Bool)

(declare-fun e!256124 () Bool)

(assert (=> b!433132 (= e!256124 e!256128)))

(declare-fun res!254875 () Bool)

(assert (=> b!433132 (=> (not res!254875) (not e!256128))))

(assert (=> b!433132 (= res!254875 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!433132 (= lt!198810 (getCurrentListMapNoExtraKeys!1443 lt!198805 lt!198806 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!433132 (= lt!198806 (array!26522 (store (arr!12710 _values!549) i!563 (ValueCellFull!5328 v!412)) (size!13062 _values!549)))))

(declare-fun lt!198811 () ListLongMap!6463)

(assert (=> b!433132 (= lt!198811 (getCurrentListMapNoExtraKeys!1443 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!18636 () Bool)

(assert (=> mapIsEmpty!18636 mapRes!18636))

(declare-fun b!433133 () Bool)

(declare-fun res!254873 () Bool)

(assert (=> b!433133 (=> (not res!254873) (not e!256130))))

(assert (=> b!433133 (= res!254873 (or (= (select (arr!12709 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12709 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!433134 () Bool)

(assert (=> b!433134 (= e!256122 tp_is_empty!11343)))

(declare-fun b!433135 () Bool)

(declare-fun res!254866 () Bool)

(assert (=> b!433135 (=> (not res!254866) (not e!256124))))

(assert (=> b!433135 (= res!254866 (arrayNoDuplicates!0 lt!198805 #b00000000000000000000000000000000 Nil!7558))))

(declare-fun b!433136 () Bool)

(declare-fun res!254876 () Bool)

(assert (=> b!433136 (=> (not res!254876) (not e!256130))))

(assert (=> b!433136 (= res!254876 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13061 _keys!709))))))

(declare-fun b!433137 () Bool)

(assert (=> b!433137 (= e!256125 true)))

(assert (=> b!433137 (= lt!198813 (+!1395 (+!1395 lt!198808 lt!198814) lt!198812))))

(declare-fun lt!198815 () Unit!12809)

(declare-fun addCommutativeForDiffKeys!384 (ListLongMap!6463 (_ BitVec 64) V!16229 (_ BitVec 64) V!16229) Unit!12809)

(assert (=> b!433137 (= lt!198815 (addCommutativeForDiffKeys!384 lt!198808 k0!794 v!412 (select (arr!12709 _keys!709) from!863) lt!198807))))

(declare-fun b!433138 () Bool)

(declare-fun res!254869 () Bool)

(assert (=> b!433138 (=> (not res!254869) (not e!256124))))

(assert (=> b!433138 (= res!254869 (bvsle from!863 i!563))))

(declare-fun b!433139 () Bool)

(declare-fun res!254872 () Bool)

(assert (=> b!433139 (=> (not res!254872) (not e!256130))))

(declare-fun arrayContainsKey!0 (array!26519 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!433139 (= res!254872 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18636 () Bool)

(declare-fun tp!36102 () Bool)

(assert (=> mapNonEmpty!18636 (= mapRes!18636 (and tp!36102 e!256131))))

(declare-fun mapValue!18636 () ValueCell!5328)

(declare-fun mapRest!18636 () (Array (_ BitVec 32) ValueCell!5328))

(declare-fun mapKey!18636 () (_ BitVec 32))

(assert (=> mapNonEmpty!18636 (= (arr!12710 _values!549) (store mapRest!18636 mapKey!18636 mapValue!18636))))

(declare-fun b!433140 () Bool)

(assert (=> b!433140 (= e!256130 e!256124)))

(declare-fun res!254871 () Bool)

(assert (=> b!433140 (=> (not res!254871) (not e!256124))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26519 (_ BitVec 32)) Bool)

(assert (=> b!433140 (= res!254871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!198805 mask!1025))))

(assert (=> b!433140 (= lt!198805 (array!26520 (store (arr!12709 _keys!709) i!563 k0!794) (size!13061 _keys!709)))))

(declare-fun b!433141 () Bool)

(declare-fun res!254870 () Bool)

(assert (=> b!433141 (=> (not res!254870) (not e!256130))))

(assert (=> b!433141 (= res!254870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!39924 res!254874) b!433123))

(assert (= (and b!433123 res!254880) b!433122))

(assert (= (and b!433122 res!254867) b!433141))

(assert (= (and b!433141 res!254870) b!433129))

(assert (= (and b!433129 res!254877) b!433136))

(assert (= (and b!433136 res!254876) b!433125))

(assert (= (and b!433125 res!254868) b!433133))

(assert (= (and b!433133 res!254873) b!433139))

(assert (= (and b!433139 res!254872) b!433140))

(assert (= (and b!433140 res!254871) b!433135))

(assert (= (and b!433135 res!254866) b!433138))

(assert (= (and b!433138 res!254869) b!433132))

(assert (= (and b!433132 res!254875) b!433127))

(assert (= (and b!433127 (not res!254879)) b!433131))

(assert (= (and b!433131 c!55622) b!433128))

(assert (= (and b!433131 (not c!55622)) b!433124))

(assert (= (and b!433131 (not res!254878)) b!433137))

(assert (= (and b!433126 condMapEmpty!18636) mapIsEmpty!18636))

(assert (= (and b!433126 (not condMapEmpty!18636)) mapNonEmpty!18636))

(get-info :version)

(assert (= (and mapNonEmpty!18636 ((_ is ValueCellFull!5328) mapValue!18636)) b!433130))

(assert (= (and b!433126 ((_ is ValueCellFull!5328) mapDefault!18636)) b!433134))

(assert (= start!39924 b!433126))

(declare-fun b_lambda!9279 () Bool)

(assert (=> (not b_lambda!9279) (not b!433131)))

(declare-fun t!13199 () Bool)

(declare-fun tb!3597 () Bool)

(assert (=> (and start!39924 (= defaultEntry!557 defaultEntry!557) t!13199) tb!3597))

(declare-fun result!6721 () Bool)

(assert (=> tb!3597 (= result!6721 tp_is_empty!11343)))

(assert (=> b!433131 t!13199))

(declare-fun b_and!18043 () Bool)

(assert (= b_and!18041 (and (=> t!13199 result!6721) b_and!18043)))

(declare-fun m!421159 () Bool)

(assert (=> b!433139 m!421159))

(declare-fun m!421161 () Bool)

(assert (=> b!433131 m!421161))

(declare-fun m!421163 () Bool)

(assert (=> b!433131 m!421163))

(assert (=> b!433131 m!421163))

(assert (=> b!433131 m!421161))

(declare-fun m!421165 () Bool)

(assert (=> b!433131 m!421165))

(declare-fun m!421167 () Bool)

(assert (=> b!433131 m!421167))

(declare-fun m!421169 () Bool)

(assert (=> b!433131 m!421169))

(assert (=> b!433127 m!421167))

(declare-fun m!421171 () Bool)

(assert (=> b!433127 m!421171))

(declare-fun m!421173 () Bool)

(assert (=> b!433127 m!421173))

(declare-fun m!421175 () Bool)

(assert (=> b!433127 m!421175))

(assert (=> b!433127 m!421167))

(declare-fun m!421177 () Bool)

(assert (=> b!433127 m!421177))

(declare-fun m!421179 () Bool)

(assert (=> b!433127 m!421179))

(declare-fun m!421181 () Bool)

(assert (=> b!433137 m!421181))

(assert (=> b!433137 m!421181))

(declare-fun m!421183 () Bool)

(assert (=> b!433137 m!421183))

(assert (=> b!433137 m!421167))

(assert (=> b!433137 m!421167))

(declare-fun m!421185 () Bool)

(assert (=> b!433137 m!421185))

(declare-fun m!421187 () Bool)

(assert (=> b!433125 m!421187))

(declare-fun m!421189 () Bool)

(assert (=> b!433129 m!421189))

(declare-fun m!421191 () Bool)

(assert (=> b!433132 m!421191))

(declare-fun m!421193 () Bool)

(assert (=> b!433132 m!421193))

(declare-fun m!421195 () Bool)

(assert (=> b!433132 m!421195))

(declare-fun m!421197 () Bool)

(assert (=> mapNonEmpty!18636 m!421197))

(declare-fun m!421199 () Bool)

(assert (=> b!433135 m!421199))

(declare-fun m!421201 () Bool)

(assert (=> start!39924 m!421201))

(declare-fun m!421203 () Bool)

(assert (=> start!39924 m!421203))

(declare-fun m!421205 () Bool)

(assert (=> b!433141 m!421205))

(declare-fun m!421207 () Bool)

(assert (=> b!433123 m!421207))

(declare-fun m!421209 () Bool)

(assert (=> b!433133 m!421209))

(declare-fun m!421211 () Bool)

(assert (=> b!433128 m!421211))

(declare-fun m!421213 () Bool)

(assert (=> b!433140 m!421213))

(declare-fun m!421215 () Bool)

(assert (=> b!433140 m!421215))

(check-sat (not b!433129) (not start!39924) (not b!433132) (not b!433141) (not b!433128) (not mapNonEmpty!18636) (not b_next!10191) (not b!433123) b_and!18043 (not b!433139) (not b_lambda!9279) (not b!433140) (not b!433127) (not b!433137) (not b!433131) (not b!433125) tp_is_empty!11343 (not b!433135))
(check-sat b_and!18043 (not b_next!10191))
