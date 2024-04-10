; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6448 () Bool)

(assert start!6448)

(declare-fun b_free!1483 () Bool)

(declare-fun b_next!1483 () Bool)

(assert (=> start!6448 (= b_free!1483 (not b_next!1483))))

(declare-fun tp!5912 () Bool)

(declare-fun b_and!2615 () Bool)

(assert (=> start!6448 (= tp!5912 b_and!2615)))

(declare-fun res!25509 () Bool)

(declare-fun e!27217 () Bool)

(assert (=> start!6448 (=> (not res!25509) (not e!27217))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6448 (= res!25509 (validMask!0 mask!853))))

(assert (=> start!6448 e!27217))

(assert (=> start!6448 true))

(assert (=> start!6448 tp!5912))

(declare-fun b!42937 () Bool)

(assert (=> b!42937 (= e!27217 (not true))))

(declare-datatypes ((array!2891 0))(
  ( (array!2892 (arr!1389 (Array (_ BitVec 32) (_ BitVec 64))) (size!1574 (_ BitVec 32))) )
))
(declare-fun lt!18189 () array!2891)

(declare-datatypes ((V!2285 0))(
  ( (V!2286 (val!975 Int)) )
))
(declare-fun lt!18192 () V!2285)

(declare-datatypes ((tuple2!1604 0))(
  ( (tuple2!1605 (_1!813 (_ BitVec 64)) (_2!813 V!2285)) )
))
(declare-datatypes ((List!1178 0))(
  ( (Nil!1175) (Cons!1174 (h!1751 tuple2!1604) (t!4157 List!1178)) )
))
(declare-datatypes ((ListLongMap!1181 0))(
  ( (ListLongMap!1182 (toList!606 List!1178)) )
))
(declare-fun lt!18193 () ListLongMap!1181)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((ValueCell!689 0))(
  ( (ValueCellFull!689 (v!2065 V!2285)) (EmptyCell!689) )
))
(declare-datatypes ((array!2893 0))(
  ( (array!2894 (arr!1390 (Array (_ BitVec 32) ValueCell!689)) (size!1575 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!358 0))(
  ( (LongMapFixedSize!359 (defaultEntry!1872 Int) (mask!5415 (_ BitVec 32)) (extraKeys!1763 (_ BitVec 32)) (zeroValue!1790 V!2285) (minValue!1790 V!2285) (_size!228 (_ BitVec 32)) (_keys!3421 array!2891) (_values!1855 array!2893) (_vacant!228 (_ BitVec 32))) )
))
(declare-fun map!817 (LongMapFixedSize!358) ListLongMap!1181)

(assert (=> b!42937 (= lt!18193 (map!817 (LongMapFixedSize!359 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18192 lt!18192 #b00000000000000000000000000000000 lt!18189 (array!2894 ((as const (Array (_ BitVec 32) ValueCell!689)) EmptyCell!689) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1179 0))(
  ( (Nil!1176) (Cons!1175 (h!1752 (_ BitVec 64)) (t!4158 List!1179)) )
))
(declare-fun arrayNoDuplicates!0 (array!2891 (_ BitVec 32) List!1179) Bool)

(assert (=> b!42937 (arrayNoDuplicates!0 lt!18189 #b00000000000000000000000000000000 Nil!1176)))

(declare-datatypes ((Unit!1179 0))(
  ( (Unit!1180) )
))
(declare-fun lt!18190 () Unit!1179)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2891 (_ BitVec 32) (_ BitVec 32) List!1179) Unit!1179)

(assert (=> b!42937 (= lt!18190 (lemmaArrayNoDuplicatesInAll0Array!0 lt!18189 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1176))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2891 (_ BitVec 32)) Bool)

(assert (=> b!42937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18189 mask!853)))

(declare-fun lt!18191 () Unit!1179)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2891 (_ BitVec 32) (_ BitVec 32)) Unit!1179)

(assert (=> b!42937 (= lt!18191 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18189 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2891 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42937 (= (arrayCountValidKeys!0 lt!18189 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18194 () Unit!1179)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2891 (_ BitVec 32) (_ BitVec 32)) Unit!1179)

(assert (=> b!42937 (= lt!18194 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18189 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42937 (= lt!18189 (array!2892 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!250 (Int (_ BitVec 64)) V!2285)

(assert (=> b!42937 (= lt!18192 (dynLambda!250 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6448 res!25509) b!42937))

(declare-fun b_lambda!2225 () Bool)

(assert (=> (not b_lambda!2225) (not b!42937)))

(declare-fun t!4156 () Bool)

(declare-fun tb!965 () Bool)

(assert (=> (and start!6448 (= defaultEntry!470 defaultEntry!470) t!4156) tb!965))

(declare-fun result!1681 () Bool)

(declare-fun tp_is_empty!1873 () Bool)

(assert (=> tb!965 (= result!1681 tp_is_empty!1873)))

(assert (=> b!42937 t!4156))

(declare-fun b_and!2617 () Bool)

(assert (= b_and!2615 (and (=> t!4156 result!1681) b_and!2617)))

(declare-fun m!36725 () Bool)

(assert (=> start!6448 m!36725))

(declare-fun m!36727 () Bool)

(assert (=> b!42937 m!36727))

(declare-fun m!36729 () Bool)

(assert (=> b!42937 m!36729))

(declare-fun m!36731 () Bool)

(assert (=> b!42937 m!36731))

(declare-fun m!36733 () Bool)

(assert (=> b!42937 m!36733))

(declare-fun m!36735 () Bool)

(assert (=> b!42937 m!36735))

(declare-fun m!36737 () Bool)

(assert (=> b!42937 m!36737))

(declare-fun m!36739 () Bool)

(assert (=> b!42937 m!36739))

(declare-fun m!36741 () Bool)

(assert (=> b!42937 m!36741))

(push 1)

(assert (not b_next!1483))

(assert (not b!42937))

(assert (not start!6448))

(assert tp_is_empty!1873)

(assert (not b_lambda!2225))

(assert b_and!2617)

(check-sat)

(pop 1)

(push 1)

(assert b_and!2617)

(assert (not b_next!1483))

(check-sat)

(pop 1)

