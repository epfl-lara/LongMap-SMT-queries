; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5936 () Bool)

(assert start!5936)

(declare-fun b_free!1415 () Bool)

(declare-fun b_next!1415 () Bool)

(assert (=> start!5936 (= b_free!1415 (not b_next!1415))))

(declare-fun tp!5810 () Bool)

(declare-fun b_and!2479 () Bool)

(assert (=> start!5936 (= tp!5810 b_and!2479)))

(declare-fun b!41657 () Bool)

(declare-fun e!26337 () Bool)

(assert (=> b!41657 (= e!26337 true)))

(declare-datatypes ((V!2165 0))(
  ( (V!2166 (val!941 Int)) )
))
(declare-datatypes ((tuple2!1536 0))(
  ( (tuple2!1537 (_1!779 (_ BitVec 64)) (_2!779 V!2165)) )
))
(declare-datatypes ((List!1104 0))(
  ( (Nil!1101) (Cons!1100 (h!1677 tuple2!1536) (t!4015 List!1104)) )
))
(declare-datatypes ((ListLongMap!1113 0))(
  ( (ListLongMap!1114 (toList!572 List!1104)) )
))
(declare-fun lt!16737 () ListLongMap!1113)

(declare-datatypes ((array!2695 0))(
  ( (array!2696 (arr!1291 (Array (_ BitVec 32) (_ BitVec 64))) (size!1443 (_ BitVec 32))) )
))
(declare-fun lt!16733 () array!2695)

(declare-fun lt!16734 () Bool)

(declare-fun mask!853 () (_ BitVec 32))

(declare-datatypes ((ValueCell!655 0))(
  ( (ValueCellFull!655 (v!2025 V!2165)) (EmptyCell!655) )
))
(declare-datatypes ((array!2697 0))(
  ( (array!2698 (arr!1292 (Array (_ BitVec 32) ValueCell!655)) (size!1444 (_ BitVec 32))) )
))
(declare-fun lt!16739 () array!2697)

(declare-fun defaultEntry!470 () Int)

(declare-fun lt!16738 () V!2165)

(declare-fun contains!540 (ListLongMap!1113 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!333 (array!2695 array!2697 (_ BitVec 32) (_ BitVec 32) V!2165 V!2165 (_ BitVec 32) Int) ListLongMap!1113)

(declare-fun head!871 (List!1104) tuple2!1536)

(assert (=> b!41657 (= lt!16734 (contains!540 (getCurrentListMap!333 lt!16733 lt!16739 mask!853 #b00000000000000000000000000000000 lt!16738 lt!16738 #b00000000000000000000000000000000 defaultEntry!470) (_1!779 (head!871 (toList!572 lt!16737)))))))

(declare-fun b!41656 () Bool)

(declare-fun res!24798 () Bool)

(assert (=> b!41656 (=> res!24798 e!26337)))

(assert (=> b!41656 (= res!24798 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun b!41655 () Bool)

(declare-fun res!24800 () Bool)

(assert (=> b!41655 (=> res!24800 e!26337)))

(declare-fun isEmpty!258 (List!1104) Bool)

(assert (=> b!41655 (= res!24800 (isEmpty!258 (toList!572 lt!16737)))))

(declare-fun b!41654 () Bool)

(declare-fun e!26338 () Bool)

(assert (=> b!41654 (= e!26338 (not e!26337))))

(declare-fun res!24799 () Bool)

(assert (=> b!41654 (=> res!24799 e!26337)))

(assert (=> b!41654 (= res!24799 (= lt!16737 (ListLongMap!1114 Nil!1101)))))

(declare-datatypes ((LongMapFixedSize!290 0))(
  ( (LongMapFixedSize!291 (defaultEntry!1835 Int) (mask!5248 (_ BitVec 32)) (extraKeys!1726 (_ BitVec 32)) (zeroValue!1753 V!2165) (minValue!1753 V!2165) (_size!194 (_ BitVec 32)) (_keys!3342 array!2695) (_values!1818 array!2697) (_vacant!194 (_ BitVec 32))) )
))
(declare-fun map!731 (LongMapFixedSize!290) ListLongMap!1113)

(assert (=> b!41654 (= lt!16737 (map!731 (LongMapFixedSize!291 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16738 lt!16738 #b00000000000000000000000000000000 lt!16733 lt!16739 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1105 0))(
  ( (Nil!1102) (Cons!1101 (h!1678 (_ BitVec 64)) (t!4016 List!1105)) )
))
(declare-fun arrayNoDuplicates!0 (array!2695 (_ BitVec 32) List!1105) Bool)

(assert (=> b!41654 (arrayNoDuplicates!0 lt!16733 #b00000000000000000000000000000000 Nil!1102)))

(declare-datatypes ((Unit!1045 0))(
  ( (Unit!1046) )
))
(declare-fun lt!16732 () Unit!1045)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2695 (_ BitVec 32) (_ BitVec 32) List!1105) Unit!1045)

(assert (=> b!41654 (= lt!16732 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16733 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2695 (_ BitVec 32)) Bool)

(assert (=> b!41654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16733 mask!853)))

(declare-fun lt!16735 () Unit!1045)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2695 (_ BitVec 32) (_ BitVec 32)) Unit!1045)

(assert (=> b!41654 (= lt!16735 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16733 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2695 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41654 (= (arrayCountValidKeys!0 lt!16733 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16736 () Unit!1045)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2695 (_ BitVec 32) (_ BitVec 32)) Unit!1045)

(assert (=> b!41654 (= lt!16736 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16733 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41654 (= lt!16739 (array!2698 ((as const (Array (_ BitVec 32) ValueCell!655)) EmptyCell!655) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41654 (= lt!16733 (array!2696 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!216 (Int (_ BitVec 64)) V!2165)

(assert (=> b!41654 (= lt!16738 (dynLambda!216 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!24801 () Bool)

(assert (=> start!5936 (=> (not res!24801) (not e!26338))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5936 (= res!24801 (validMask!0 mask!853))))

(assert (=> start!5936 e!26338))

(assert (=> start!5936 true))

(assert (=> start!5936 tp!5810))

(assert (= (and start!5936 res!24801) b!41654))

(assert (= (and b!41654 (not res!24799)) b!41655))

(assert (= (and b!41655 (not res!24800)) b!41656))

(assert (= (and b!41656 (not res!24798)) b!41657))

(declare-fun b_lambda!2139 () Bool)

(assert (=> (not b_lambda!2139) (not b!41654)))

(declare-fun t!4014 () Bool)

(declare-fun tb!897 () Bool)

(assert (=> (and start!5936 (= defaultEntry!470 defaultEntry!470) t!4014) tb!897))

(declare-fun result!1545 () Bool)

(declare-fun tp_is_empty!1805 () Bool)

(assert (=> tb!897 (= result!1545 tp_is_empty!1805)))

(assert (=> b!41654 t!4014))

(declare-fun b_and!2481 () Bool)

(assert (= b_and!2479 (and (=> t!4014 result!1545) b_and!2481)))

(declare-fun m!35105 () Bool)

(assert (=> b!41657 m!35105))

(declare-fun m!35107 () Bool)

(assert (=> b!41657 m!35107))

(assert (=> b!41657 m!35105))

(declare-fun m!35109 () Bool)

(assert (=> b!41657 m!35109))

(declare-fun m!35111 () Bool)

(assert (=> b!41655 m!35111))

(declare-fun m!35113 () Bool)

(assert (=> b!41654 m!35113))

(declare-fun m!35115 () Bool)

(assert (=> b!41654 m!35115))

(declare-fun m!35117 () Bool)

(assert (=> b!41654 m!35117))

(declare-fun m!35119 () Bool)

(assert (=> b!41654 m!35119))

(declare-fun m!35121 () Bool)

(assert (=> b!41654 m!35121))

(declare-fun m!35123 () Bool)

(assert (=> b!41654 m!35123))

(declare-fun m!35125 () Bool)

(assert (=> b!41654 m!35125))

(declare-fun m!35127 () Bool)

(assert (=> b!41654 m!35127))

(declare-fun m!35129 () Bool)

(assert (=> start!5936 m!35129))

(push 1)

(assert (not start!5936))

(assert (not b!41657))

(assert tp_is_empty!1805)

(assert (not b!41655))

(assert (not b_lambda!2139))

(assert (not b_next!1415))

(assert b_and!2481)

(assert (not b!41654))

(check-sat)

