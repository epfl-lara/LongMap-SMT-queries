; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6454 () Bool)

(assert start!6454)

(declare-fun b_free!1489 () Bool)

(declare-fun b_next!1489 () Bool)

(assert (=> start!6454 (= b_free!1489 (not b_next!1489))))

(declare-fun tp!5921 () Bool)

(declare-fun b_and!2627 () Bool)

(assert (=> start!6454 (= tp!5921 b_and!2627)))

(declare-fun res!25518 () Bool)

(declare-fun e!27226 () Bool)

(assert (=> start!6454 (=> (not res!25518) (not e!27226))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6454 (= res!25518 (validMask!0 mask!853))))

(assert (=> start!6454 e!27226))

(assert (=> start!6454 true))

(assert (=> start!6454 tp!5921))

(declare-fun b!42952 () Bool)

(assert (=> b!42952 (= e!27226 (not true))))

(declare-datatypes ((V!2293 0))(
  ( (V!2294 (val!978 Int)) )
))
(declare-datatypes ((tuple2!1610 0))(
  ( (tuple2!1611 (_1!816 (_ BitVec 64)) (_2!816 V!2293)) )
))
(declare-datatypes ((List!1184 0))(
  ( (Nil!1181) (Cons!1180 (h!1757 tuple2!1610) (t!4169 List!1184)) )
))
(declare-datatypes ((ListLongMap!1187 0))(
  ( (ListLongMap!1188 (toList!609 List!1184)) )
))
(declare-fun lt!18245 () ListLongMap!1187)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((array!2903 0))(
  ( (array!2904 (arr!1395 (Array (_ BitVec 32) (_ BitVec 64))) (size!1580 (_ BitVec 32))) )
))
(declare-fun lt!18247 () array!2903)

(declare-fun lt!18243 () V!2293)

(declare-datatypes ((ValueCell!692 0))(
  ( (ValueCellFull!692 (v!2068 V!2293)) (EmptyCell!692) )
))
(declare-datatypes ((array!2905 0))(
  ( (array!2906 (arr!1396 (Array (_ BitVec 32) ValueCell!692)) (size!1581 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!364 0))(
  ( (LongMapFixedSize!365 (defaultEntry!1875 Int) (mask!5420 (_ BitVec 32)) (extraKeys!1766 (_ BitVec 32)) (zeroValue!1793 V!2293) (minValue!1793 V!2293) (_size!231 (_ BitVec 32)) (_keys!3424 array!2903) (_values!1858 array!2905) (_vacant!231 (_ BitVec 32))) )
))
(declare-fun map!822 (LongMapFixedSize!364) ListLongMap!1187)

(assert (=> b!42952 (= lt!18245 (map!822 (LongMapFixedSize!365 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18243 lt!18243 #b00000000000000000000000000000000 lt!18247 (array!2906 ((as const (Array (_ BitVec 32) ValueCell!692)) EmptyCell!692) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1185 0))(
  ( (Nil!1182) (Cons!1181 (h!1758 (_ BitVec 64)) (t!4170 List!1185)) )
))
(declare-fun arrayNoDuplicates!0 (array!2903 (_ BitVec 32) List!1185) Bool)

(assert (=> b!42952 (arrayNoDuplicates!0 lt!18247 #b00000000000000000000000000000000 Nil!1182)))

(declare-datatypes ((Unit!1185 0))(
  ( (Unit!1186) )
))
(declare-fun lt!18244 () Unit!1185)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2903 (_ BitVec 32) (_ BitVec 32) List!1185) Unit!1185)

(assert (=> b!42952 (= lt!18244 (lemmaArrayNoDuplicatesInAll0Array!0 lt!18247 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1182))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2903 (_ BitVec 32)) Bool)

(assert (=> b!42952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18247 mask!853)))

(declare-fun lt!18246 () Unit!1185)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2903 (_ BitVec 32) (_ BitVec 32)) Unit!1185)

(assert (=> b!42952 (= lt!18246 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18247 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2903 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42952 (= (arrayCountValidKeys!0 lt!18247 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18248 () Unit!1185)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2903 (_ BitVec 32) (_ BitVec 32)) Unit!1185)

(assert (=> b!42952 (= lt!18248 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18247 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42952 (= lt!18247 (array!2904 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!253 (Int (_ BitVec 64)) V!2293)

(assert (=> b!42952 (= lt!18243 (dynLambda!253 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6454 res!25518) b!42952))

(declare-fun b_lambda!2231 () Bool)

(assert (=> (not b_lambda!2231) (not b!42952)))

(declare-fun t!4168 () Bool)

(declare-fun tb!971 () Bool)

(assert (=> (and start!6454 (= defaultEntry!470 defaultEntry!470) t!4168) tb!971))

(declare-fun result!1693 () Bool)

(declare-fun tp_is_empty!1879 () Bool)

(assert (=> tb!971 (= result!1693 tp_is_empty!1879)))

(assert (=> b!42952 t!4168))

(declare-fun b_and!2629 () Bool)

(assert (= b_and!2627 (and (=> t!4168 result!1693) b_and!2629)))

(declare-fun m!36779 () Bool)

(assert (=> start!6454 m!36779))

(declare-fun m!36781 () Bool)

(assert (=> b!42952 m!36781))

(declare-fun m!36783 () Bool)

(assert (=> b!42952 m!36783))

(declare-fun m!36785 () Bool)

(assert (=> b!42952 m!36785))

(declare-fun m!36787 () Bool)

(assert (=> b!42952 m!36787))

(declare-fun m!36789 () Bool)

(assert (=> b!42952 m!36789))

(declare-fun m!36791 () Bool)

(assert (=> b!42952 m!36791))

(declare-fun m!36793 () Bool)

(assert (=> b!42952 m!36793))

(declare-fun m!36795 () Bool)

(assert (=> b!42952 m!36795))

(push 1)

(assert (not start!6454))

(assert (not b_next!1489))

(assert tp_is_empty!1879)

(assert (not b!42952))

(assert b_and!2629)

(assert (not b_lambda!2231))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2629)

(assert (not b_next!1489))

(check-sat)

(pop 1)

