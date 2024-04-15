; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37464 () Bool)

(assert start!37464)

(declare-fun b_free!8605 () Bool)

(declare-fun b_next!8605 () Bool)

(assert (=> start!37464 (= b_free!8605 (not b_next!8605))))

(declare-fun tp!30530 () Bool)

(declare-fun b_and!15821 () Bool)

(assert (=> start!37464 (= tp!30530 b_and!15821)))

(declare-fun mapIsEmpty!15444 () Bool)

(declare-fun mapRes!15444 () Bool)

(assert (=> mapIsEmpty!15444 mapRes!15444))

(declare-fun b!381711 () Bool)

(declare-fun res!217038 () Bool)

(declare-fun e!232003 () Bool)

(assert (=> b!381711 (=> (not res!217038) (not e!232003))))

(declare-datatypes ((array!22401 0))(
  ( (array!22402 (arr!10669 (Array (_ BitVec 32) (_ BitVec 64))) (size!11022 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22401)

(declare-datatypes ((List!6076 0))(
  ( (Nil!6073) (Cons!6072 (h!6928 (_ BitVec 64)) (t!11217 List!6076)) )
))
(declare-fun arrayNoDuplicates!0 (array!22401 (_ BitVec 32) List!6076) Bool)

(assert (=> b!381711 (= res!217038 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6073))))

(declare-fun b!381712 () Bool)

(declare-fun res!217044 () Bool)

(declare-fun e!232000 () Bool)

(assert (=> b!381712 (=> (not res!217044) (not e!232000))))

(declare-fun lt!178902 () array!22401)

(assert (=> b!381712 (= res!217044 (arrayNoDuplicates!0 lt!178902 #b00000000000000000000000000000000 Nil!6073))))

(declare-fun mapNonEmpty!15444 () Bool)

(declare-fun tp!30531 () Bool)

(declare-fun e!231999 () Bool)

(assert (=> mapNonEmpty!15444 (= mapRes!15444 (and tp!30531 e!231999))))

(declare-datatypes ((V!13443 0))(
  ( (V!13444 (val!4671 Int)) )
))
(declare-datatypes ((ValueCell!4283 0))(
  ( (ValueCellFull!4283 (v!6862 V!13443)) (EmptyCell!4283) )
))
(declare-datatypes ((array!22403 0))(
  ( (array!22404 (arr!10670 (Array (_ BitVec 32) ValueCell!4283)) (size!11023 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22403)

(declare-fun mapKey!15444 () (_ BitVec 32))

(declare-fun mapValue!15444 () ValueCell!4283)

(declare-fun mapRest!15444 () (Array (_ BitVec 32) ValueCell!4283))

(assert (=> mapNonEmpty!15444 (= (arr!10670 _values!506) (store mapRest!15444 mapKey!15444 mapValue!15444))))

(declare-fun b!381714 () Bool)

(declare-fun tp_is_empty!9253 () Bool)

(assert (=> b!381714 (= e!231999 tp_is_empty!9253)))

(declare-fun b!381715 () Bool)

(declare-fun res!217045 () Bool)

(assert (=> b!381715 (=> (not res!217045) (not e!232003))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!381715 (= res!217045 (validKeyInArray!0 k0!778))))

(declare-fun b!381716 () Bool)

(declare-fun e!231998 () Bool)

(assert (=> b!381716 (= e!232000 (not e!231998))))

(declare-fun res!217041 () Bool)

(assert (=> b!381716 (=> res!217041 e!231998)))

(declare-fun lt!178901 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!381716 (= res!217041 (or (and (not lt!178901) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!178901) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!178901)))))

(assert (=> b!381716 (= lt!178901 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6250 0))(
  ( (tuple2!6251 (_1!3136 (_ BitVec 64)) (_2!3136 V!13443)) )
))
(declare-datatypes ((List!6077 0))(
  ( (Nil!6074) (Cons!6073 (h!6929 tuple2!6250) (t!11218 List!6077)) )
))
(declare-datatypes ((ListLongMap!5153 0))(
  ( (ListLongMap!5154 (toList!2592 List!6077)) )
))
(declare-fun lt!178894 () ListLongMap!5153)

(declare-fun zeroValue!472 () V!13443)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13443)

(declare-fun getCurrentListMap!1980 (array!22401 array!22403 (_ BitVec 32) (_ BitVec 32) V!13443 V!13443 (_ BitVec 32) Int) ListLongMap!5153)

(assert (=> b!381716 (= lt!178894 (getCurrentListMap!1980 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178895 () ListLongMap!5153)

(declare-fun lt!178898 () array!22403)

(assert (=> b!381716 (= lt!178895 (getCurrentListMap!1980 lt!178902 lt!178898 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178900 () ListLongMap!5153)

(declare-fun lt!178899 () ListLongMap!5153)

(assert (=> b!381716 (and (= lt!178900 lt!178899) (= lt!178899 lt!178900))))

(declare-fun v!373 () V!13443)

(declare-fun lt!178897 () ListLongMap!5153)

(declare-fun +!954 (ListLongMap!5153 tuple2!6250) ListLongMap!5153)

(assert (=> b!381716 (= lt!178899 (+!954 lt!178897 (tuple2!6251 k0!778 v!373)))))

(declare-datatypes ((Unit!11766 0))(
  ( (Unit!11767) )
))
(declare-fun lt!178896 () Unit!11766)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!173 (array!22401 array!22403 (_ BitVec 32) (_ BitVec 32) V!13443 V!13443 (_ BitVec 32) (_ BitVec 64) V!13443 (_ BitVec 32) Int) Unit!11766)

(assert (=> b!381716 (= lt!178896 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!173 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!845 (array!22401 array!22403 (_ BitVec 32) (_ BitVec 32) V!13443 V!13443 (_ BitVec 32) Int) ListLongMap!5153)

(assert (=> b!381716 (= lt!178900 (getCurrentListMapNoExtraKeys!845 lt!178902 lt!178898 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!381716 (= lt!178898 (array!22404 (store (arr!10670 _values!506) i!548 (ValueCellFull!4283 v!373)) (size!11023 _values!506)))))

(assert (=> b!381716 (= lt!178897 (getCurrentListMapNoExtraKeys!845 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!381717 () Bool)

(declare-fun e!232004 () Bool)

(declare-fun e!232001 () Bool)

(assert (=> b!381717 (= e!232004 (and e!232001 mapRes!15444))))

(declare-fun condMapEmpty!15444 () Bool)

(declare-fun mapDefault!15444 () ValueCell!4283)

(assert (=> b!381717 (= condMapEmpty!15444 (= (arr!10670 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4283)) mapDefault!15444)))))

(declare-fun b!381718 () Bool)

(assert (=> b!381718 (= e!232001 tp_is_empty!9253)))

(declare-fun b!381719 () Bool)

(declare-fun res!217043 () Bool)

(assert (=> b!381719 (=> (not res!217043) (not e!232003))))

(declare-fun arrayContainsKey!0 (array!22401 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!381719 (= res!217043 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!381720 () Bool)

(declare-fun res!217046 () Bool)

(assert (=> b!381720 (=> (not res!217046) (not e!232003))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22401 (_ BitVec 32)) Bool)

(assert (=> b!381720 (= res!217046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!217042 () Bool)

(assert (=> start!37464 (=> (not res!217042) (not e!232003))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37464 (= res!217042 (validMask!0 mask!970))))

(assert (=> start!37464 e!232003))

(declare-fun array_inv!7858 (array!22403) Bool)

(assert (=> start!37464 (and (array_inv!7858 _values!506) e!232004)))

(assert (=> start!37464 tp!30530))

(assert (=> start!37464 true))

(assert (=> start!37464 tp_is_empty!9253))

(declare-fun array_inv!7859 (array!22401) Bool)

(assert (=> start!37464 (array_inv!7859 _keys!658)))

(declare-fun b!381713 () Bool)

(assert (=> b!381713 (= e!232003 e!232000)))

(declare-fun res!217040 () Bool)

(assert (=> b!381713 (=> (not res!217040) (not e!232000))))

(assert (=> b!381713 (= res!217040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178902 mask!970))))

(assert (=> b!381713 (= lt!178902 (array!22402 (store (arr!10669 _keys!658) i!548 k0!778) (size!11022 _keys!658)))))

(declare-fun b!381721 () Bool)

(declare-fun res!217037 () Bool)

(assert (=> b!381721 (=> (not res!217037) (not e!232003))))

(assert (=> b!381721 (= res!217037 (or (= (select (arr!10669 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10669 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!381722 () Bool)

(declare-fun res!217039 () Bool)

(assert (=> b!381722 (=> (not res!217039) (not e!232003))))

(assert (=> b!381722 (= res!217039 (and (= (size!11023 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11022 _keys!658) (size!11023 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!381723 () Bool)

(declare-fun res!217036 () Bool)

(assert (=> b!381723 (=> (not res!217036) (not e!232003))))

(assert (=> b!381723 (= res!217036 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11022 _keys!658))))))

(declare-fun b!381724 () Bool)

(assert (=> b!381724 (= e!231998 true)))

(assert (=> b!381724 (= lt!178895 lt!178900)))

(assert (= (and start!37464 res!217042) b!381722))

(assert (= (and b!381722 res!217039) b!381720))

(assert (= (and b!381720 res!217046) b!381711))

(assert (= (and b!381711 res!217038) b!381723))

(assert (= (and b!381723 res!217036) b!381715))

(assert (= (and b!381715 res!217045) b!381721))

(assert (= (and b!381721 res!217037) b!381719))

(assert (= (and b!381719 res!217043) b!381713))

(assert (= (and b!381713 res!217040) b!381712))

(assert (= (and b!381712 res!217044) b!381716))

(assert (= (and b!381716 (not res!217041)) b!381724))

(assert (= (and b!381717 condMapEmpty!15444) mapIsEmpty!15444))

(assert (= (and b!381717 (not condMapEmpty!15444)) mapNonEmpty!15444))

(get-info :version)

(assert (= (and mapNonEmpty!15444 ((_ is ValueCellFull!4283) mapValue!15444)) b!381714))

(assert (= (and b!381717 ((_ is ValueCellFull!4283) mapDefault!15444)) b!381718))

(assert (= start!37464 b!381717))

(declare-fun m!378125 () Bool)

(assert (=> mapNonEmpty!15444 m!378125))

(declare-fun m!378127 () Bool)

(assert (=> b!381716 m!378127))

(declare-fun m!378129 () Bool)

(assert (=> b!381716 m!378129))

(declare-fun m!378131 () Bool)

(assert (=> b!381716 m!378131))

(declare-fun m!378133 () Bool)

(assert (=> b!381716 m!378133))

(declare-fun m!378135 () Bool)

(assert (=> b!381716 m!378135))

(declare-fun m!378137 () Bool)

(assert (=> b!381716 m!378137))

(declare-fun m!378139 () Bool)

(assert (=> b!381716 m!378139))

(declare-fun m!378141 () Bool)

(assert (=> b!381713 m!378141))

(declare-fun m!378143 () Bool)

(assert (=> b!381713 m!378143))

(declare-fun m!378145 () Bool)

(assert (=> start!37464 m!378145))

(declare-fun m!378147 () Bool)

(assert (=> start!37464 m!378147))

(declare-fun m!378149 () Bool)

(assert (=> start!37464 m!378149))

(declare-fun m!378151 () Bool)

(assert (=> b!381715 m!378151))

(declare-fun m!378153 () Bool)

(assert (=> b!381719 m!378153))

(declare-fun m!378155 () Bool)

(assert (=> b!381720 m!378155))

(declare-fun m!378157 () Bool)

(assert (=> b!381711 m!378157))

(declare-fun m!378159 () Bool)

(assert (=> b!381712 m!378159))

(declare-fun m!378161 () Bool)

(assert (=> b!381721 m!378161))

(check-sat (not b!381711) (not b!381719) (not mapNonEmpty!15444) (not b!381720) (not b!381713) (not start!37464) b_and!15821 (not b!381716) (not b!381712) (not b!381715) tp_is_empty!9253 (not b_next!8605))
(check-sat b_and!15821 (not b_next!8605))
