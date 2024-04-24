; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71258 () Bool)

(assert start!71258)

(declare-fun b_free!13279 () Bool)

(declare-fun b_next!13279 () Bool)

(assert (=> start!71258 (= b_free!13279 (not b_next!13279))))

(declare-fun tp!46594 () Bool)

(declare-fun b_and!22203 () Bool)

(assert (=> start!71258 (= tp!46594 b_and!22203)))

(declare-fun b!826542 () Bool)

(declare-fun e!460181 () Bool)

(declare-fun tp_is_empty!14989 () Bool)

(assert (=> b!826542 (= e!460181 tp_is_empty!14989)))

(declare-fun b!826543 () Bool)

(declare-datatypes ((V!24987 0))(
  ( (V!24988 (val!7542 Int)) )
))
(declare-datatypes ((tuple2!9908 0))(
  ( (tuple2!9909 (_1!4965 (_ BitVec 64)) (_2!4965 V!24987)) )
))
(declare-datatypes ((List!15692 0))(
  ( (Nil!15689) (Cons!15688 (h!16823 tuple2!9908) (t!22029 List!15692)) )
))
(declare-datatypes ((ListLongMap!8733 0))(
  ( (ListLongMap!8734 (toList!4382 List!15692)) )
))
(declare-fun lt!373331 () ListLongMap!8733)

(declare-fun e!460187 () Bool)

(declare-fun lt!373321 () tuple2!9908)

(declare-fun lt!373320 () ListLongMap!8733)

(declare-fun lt!373332 () tuple2!9908)

(declare-fun +!1929 (ListLongMap!8733 tuple2!9908) ListLongMap!8733)

(assert (=> b!826543 (= e!460187 (= lt!373331 (+!1929 (+!1929 lt!373320 lt!373332) lt!373321)))))

(declare-fun b!826545 () Bool)

(declare-fun e!460182 () Bool)

(assert (=> b!826545 (= e!460182 true)))

(declare-fun lt!373330 () ListLongMap!8733)

(declare-fun lt!373324 () ListLongMap!8733)

(assert (=> b!826545 (= lt!373324 (+!1929 (+!1929 lt!373330 lt!373321) lt!373332))))

(declare-fun lt!373325 () ListLongMap!8733)

(declare-fun lt!373327 () ListLongMap!8733)

(assert (=> b!826545 (and (= lt!373325 lt!373327) (= lt!373331 lt!373327) (= lt!373331 lt!373325))))

(declare-fun lt!373329 () ListLongMap!8733)

(assert (=> b!826545 (= lt!373327 (+!1929 lt!373329 lt!373321))))

(declare-fun lt!373319 () ListLongMap!8733)

(assert (=> b!826545 (= lt!373325 (+!1929 lt!373319 lt!373321))))

(declare-fun zeroValueBefore!34 () V!24987)

(declare-datatypes ((Unit!28314 0))(
  ( (Unit!28315) )
))
(declare-fun lt!373326 () Unit!28314)

(declare-fun zeroValueAfter!34 () V!24987)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!215 (ListLongMap!8733 (_ BitVec 64) V!24987 V!24987) Unit!28314)

(assert (=> b!826545 (= lt!373326 (addSameAsAddTwiceSameKeyDiffValues!215 lt!373319 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!826545 e!460187))

(declare-fun res!563194 () Bool)

(assert (=> b!826545 (=> (not res!563194) (not e!460187))))

(declare-fun lt!373328 () ListLongMap!8733)

(assert (=> b!826545 (= res!563194 (= lt!373328 lt!373329))))

(declare-fun lt!373323 () tuple2!9908)

(assert (=> b!826545 (= lt!373329 (+!1929 lt!373319 lt!373323))))

(assert (=> b!826545 (= lt!373319 (+!1929 lt!373330 lt!373332))))

(assert (=> b!826545 (= lt!373321 (tuple2!9909 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!460183 () Bool)

(assert (=> b!826545 e!460183))

(declare-fun res!563190 () Bool)

(assert (=> b!826545 (=> (not res!563190) (not e!460183))))

(assert (=> b!826545 (= res!563190 (= lt!373328 (+!1929 (+!1929 lt!373330 lt!373323) lt!373332)))))

(declare-fun minValue!754 () V!24987)

(assert (=> b!826545 (= lt!373332 (tuple2!9909 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!826545 (= lt!373323 (tuple2!9909 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((array!46161 0))(
  ( (array!46162 (arr!22122 (Array (_ BitVec 32) (_ BitVec 64))) (size!22542 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46161)

(declare-datatypes ((ValueCell!7079 0))(
  ( (ValueCellFull!7079 (v!9975 V!24987)) (EmptyCell!7079) )
))
(declare-datatypes ((array!46163 0))(
  ( (array!46164 (arr!22123 (Array (_ BitVec 32) ValueCell!7079)) (size!22543 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46163)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2506 (array!46161 array!46163 (_ BitVec 32) (_ BitVec 32) V!24987 V!24987 (_ BitVec 32) Int) ListLongMap!8733)

(assert (=> b!826545 (= lt!373331 (getCurrentListMap!2506 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!826545 (= lt!373328 (getCurrentListMap!2506 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826546 () Bool)

(declare-fun e!460186 () Bool)

(declare-fun e!460185 () Bool)

(declare-fun mapRes!24106 () Bool)

(assert (=> b!826546 (= e!460186 (and e!460185 mapRes!24106))))

(declare-fun condMapEmpty!24106 () Bool)

(declare-fun mapDefault!24106 () ValueCell!7079)

(assert (=> b!826546 (= condMapEmpty!24106 (= (arr!22123 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7079)) mapDefault!24106)))))

(declare-fun b!826547 () Bool)

(declare-fun res!563192 () Bool)

(declare-fun e!460180 () Bool)

(assert (=> b!826547 (=> (not res!563192) (not e!460180))))

(declare-datatypes ((List!15693 0))(
  ( (Nil!15690) (Cons!15689 (h!16824 (_ BitVec 64)) (t!22030 List!15693)) )
))
(declare-fun arrayNoDuplicates!0 (array!46161 (_ BitVec 32) List!15693) Bool)

(assert (=> b!826547 (= res!563192 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15690))))

(declare-fun b!826548 () Bool)

(assert (=> b!826548 (= e!460180 (not e!460182))))

(declare-fun res!563193 () Bool)

(assert (=> b!826548 (=> res!563193 e!460182)))

(assert (=> b!826548 (= res!563193 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!826548 (= lt!373330 lt!373320)))

(declare-fun lt!373322 () Unit!28314)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!550 (array!46161 array!46163 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24987 V!24987 V!24987 V!24987 (_ BitVec 32) Int) Unit!28314)

(assert (=> b!826548 (= lt!373322 (lemmaNoChangeToArrayThenSameMapNoExtras!550 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2462 (array!46161 array!46163 (_ BitVec 32) (_ BitVec 32) V!24987 V!24987 (_ BitVec 32) Int) ListLongMap!8733)

(assert (=> b!826548 (= lt!373320 (getCurrentListMapNoExtraKeys!2462 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826548 (= lt!373330 (getCurrentListMapNoExtraKeys!2462 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826549 () Bool)

(assert (=> b!826549 (= e!460183 (= lt!373331 (+!1929 (+!1929 lt!373320 (tuple2!9909 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!373332)))))

(declare-fun b!826550 () Bool)

(declare-fun res!563191 () Bool)

(assert (=> b!826550 (=> (not res!563191) (not e!460180))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46161 (_ BitVec 32)) Bool)

(assert (=> b!826550 (= res!563191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!24106 () Bool)

(declare-fun tp!46593 () Bool)

(assert (=> mapNonEmpty!24106 (= mapRes!24106 (and tp!46593 e!460181))))

(declare-fun mapRest!24106 () (Array (_ BitVec 32) ValueCell!7079))

(declare-fun mapKey!24106 () (_ BitVec 32))

(declare-fun mapValue!24106 () ValueCell!7079)

(assert (=> mapNonEmpty!24106 (= (arr!22123 _values!788) (store mapRest!24106 mapKey!24106 mapValue!24106))))

(declare-fun mapIsEmpty!24106 () Bool)

(assert (=> mapIsEmpty!24106 mapRes!24106))

(declare-fun b!826551 () Bool)

(assert (=> b!826551 (= e!460185 tp_is_empty!14989)))

(declare-fun res!563189 () Bool)

(assert (=> start!71258 (=> (not res!563189) (not e!460180))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71258 (= res!563189 (validMask!0 mask!1312))))

(assert (=> start!71258 e!460180))

(assert (=> start!71258 tp_is_empty!14989))

(declare-fun array_inv!17677 (array!46161) Bool)

(assert (=> start!71258 (array_inv!17677 _keys!976)))

(assert (=> start!71258 true))

(declare-fun array_inv!17678 (array!46163) Bool)

(assert (=> start!71258 (and (array_inv!17678 _values!788) e!460186)))

(assert (=> start!71258 tp!46594))

(declare-fun b!826544 () Bool)

(declare-fun res!563195 () Bool)

(assert (=> b!826544 (=> (not res!563195) (not e!460180))))

(assert (=> b!826544 (= res!563195 (and (= (size!22543 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22542 _keys!976) (size!22543 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!71258 res!563189) b!826544))

(assert (= (and b!826544 res!563195) b!826550))

(assert (= (and b!826550 res!563191) b!826547))

(assert (= (and b!826547 res!563192) b!826548))

(assert (= (and b!826548 (not res!563193)) b!826545))

(assert (= (and b!826545 res!563190) b!826549))

(assert (= (and b!826545 res!563194) b!826543))

(assert (= (and b!826546 condMapEmpty!24106) mapIsEmpty!24106))

(assert (= (and b!826546 (not condMapEmpty!24106)) mapNonEmpty!24106))

(get-info :version)

(assert (= (and mapNonEmpty!24106 ((_ is ValueCellFull!7079) mapValue!24106)) b!826542))

(assert (= (and b!826546 ((_ is ValueCellFull!7079) mapDefault!24106)) b!826551))

(assert (= start!71258 b!826546))

(declare-fun m!769215 () Bool)

(assert (=> b!826549 m!769215))

(assert (=> b!826549 m!769215))

(declare-fun m!769217 () Bool)

(assert (=> b!826549 m!769217))

(declare-fun m!769219 () Bool)

(assert (=> b!826548 m!769219))

(declare-fun m!769221 () Bool)

(assert (=> b!826548 m!769221))

(declare-fun m!769223 () Bool)

(assert (=> b!826548 m!769223))

(declare-fun m!769225 () Bool)

(assert (=> b!826550 m!769225))

(declare-fun m!769227 () Bool)

(assert (=> b!826547 m!769227))

(declare-fun m!769229 () Bool)

(assert (=> b!826545 m!769229))

(declare-fun m!769231 () Bool)

(assert (=> b!826545 m!769231))

(declare-fun m!769233 () Bool)

(assert (=> b!826545 m!769233))

(declare-fun m!769235 () Bool)

(assert (=> b!826545 m!769235))

(declare-fun m!769237 () Bool)

(assert (=> b!826545 m!769237))

(declare-fun m!769239 () Bool)

(assert (=> b!826545 m!769239))

(declare-fun m!769241 () Bool)

(assert (=> b!826545 m!769241))

(declare-fun m!769243 () Bool)

(assert (=> b!826545 m!769243))

(declare-fun m!769245 () Bool)

(assert (=> b!826545 m!769245))

(assert (=> b!826545 m!769235))

(declare-fun m!769247 () Bool)

(assert (=> b!826545 m!769247))

(declare-fun m!769249 () Bool)

(assert (=> b!826545 m!769249))

(assert (=> b!826545 m!769229))

(declare-fun m!769251 () Bool)

(assert (=> b!826543 m!769251))

(assert (=> b!826543 m!769251))

(declare-fun m!769253 () Bool)

(assert (=> b!826543 m!769253))

(declare-fun m!769255 () Bool)

(assert (=> start!71258 m!769255))

(declare-fun m!769257 () Bool)

(assert (=> start!71258 m!769257))

(declare-fun m!769259 () Bool)

(assert (=> start!71258 m!769259))

(declare-fun m!769261 () Bool)

(assert (=> mapNonEmpty!24106 m!769261))

(check-sat (not b!826548) (not b!826549) (not start!71258) (not b_next!13279) tp_is_empty!14989 (not mapNonEmpty!24106) b_and!22203 (not b!826547) (not b!826550) (not b!826545) (not b!826543))
(check-sat b_and!22203 (not b_next!13279))
