; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38718 () Bool)

(assert start!38718)

(declare-fun b_free!9255 () Bool)

(declare-fun b_next!9255 () Bool)

(assert (=> start!38718 (= b_free!9255 (not b_next!9255))))

(declare-fun tp!32889 () Bool)

(declare-fun b_and!16641 () Bool)

(assert (=> start!38718 (= tp!32889 b_and!16641)))

(declare-fun b!402961 () Bool)

(declare-fun res!232168 () Bool)

(declare-fun e!242685 () Bool)

(assert (=> b!402961 (=> (not res!232168) (not e!242685))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!402961 (= res!232168 (validMask!0 mask!1025))))

(declare-fun b!402963 () Bool)

(declare-fun e!242679 () Bool)

(assert (=> b!402963 (= e!242685 e!242679)))

(declare-fun res!232169 () Bool)

(assert (=> b!402963 (=> (not res!232169) (not e!242679))))

(declare-datatypes ((array!24179 0))(
  ( (array!24180 (arr!11539 (Array (_ BitVec 32) (_ BitVec 64))) (size!11891 (_ BitVec 32))) )
))
(declare-fun lt!187990 () array!24179)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24179 (_ BitVec 32)) Bool)

(assert (=> b!402963 (= res!232169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187990 mask!1025))))

(declare-fun _keys!709 () array!24179)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!402963 (= lt!187990 (array!24180 (store (arr!11539 _keys!709) i!563 k0!794) (size!11891 _keys!709)))))

(declare-fun mapIsEmpty!16827 () Bool)

(declare-fun mapRes!16827 () Bool)

(assert (=> mapIsEmpty!16827 mapRes!16827))

(declare-fun b!402964 () Bool)

(declare-fun res!232171 () Bool)

(assert (=> b!402964 (=> (not res!232171) (not e!242685))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14621 0))(
  ( (V!14622 (val!5113 Int)) )
))
(declare-datatypes ((ValueCell!4725 0))(
  ( (ValueCellFull!4725 (v!7360 V!14621)) (EmptyCell!4725) )
))
(declare-datatypes ((array!24181 0))(
  ( (array!24182 (arr!11540 (Array (_ BitVec 32) ValueCell!4725)) (size!11892 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24181)

(assert (=> b!402964 (= res!232171 (and (= (size!11892 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11891 _keys!709) (size!11892 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun minValue!515 () V!14621)

(declare-fun defaultEntry!557 () Int)

(declare-fun bm!28426 () Bool)

(declare-fun zeroValue!515 () V!14621)

(declare-fun c!54839 () Bool)

(declare-fun v!412 () V!14621)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!6794 0))(
  ( (tuple2!6795 (_1!3408 (_ BitVec 64)) (_2!3408 V!14621)) )
))
(declare-datatypes ((List!6715 0))(
  ( (Nil!6712) (Cons!6711 (h!7567 tuple2!6794) (t!11889 List!6715)) )
))
(declare-datatypes ((ListLongMap!5707 0))(
  ( (ListLongMap!5708 (toList!2869 List!6715)) )
))
(declare-fun call!28430 () ListLongMap!5707)

(declare-fun getCurrentListMapNoExtraKeys!1079 (array!24179 array!24181 (_ BitVec 32) (_ BitVec 32) V!14621 V!14621 (_ BitVec 32) Int) ListLongMap!5707)

(assert (=> bm!28426 (= call!28430 (getCurrentListMapNoExtraKeys!1079 (ite c!54839 _keys!709 lt!187990) (ite c!54839 _values!549 (array!24182 (store (arr!11540 _values!549) i!563 (ValueCellFull!4725 v!412)) (size!11892 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402965 () Bool)

(declare-fun res!232167 () Bool)

(assert (=> b!402965 (=> (not res!232167) (not e!242685))))

(assert (=> b!402965 (= res!232167 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11891 _keys!709))))))

(declare-fun b!402966 () Bool)

(declare-fun res!232164 () Bool)

(assert (=> b!402966 (=> (not res!232164) (not e!242685))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!402966 (= res!232164 (validKeyInArray!0 k0!794))))

(declare-fun b!402967 () Bool)

(declare-fun e!242683 () Bool)

(declare-fun tp_is_empty!10137 () Bool)

(assert (=> b!402967 (= e!242683 tp_is_empty!10137)))

(declare-fun b!402968 () Bool)

(declare-fun e!242682 () Bool)

(assert (=> b!402968 (= e!242682 (and e!242683 mapRes!16827))))

(declare-fun condMapEmpty!16827 () Bool)

(declare-fun mapDefault!16827 () ValueCell!4725)

(assert (=> b!402968 (= condMapEmpty!16827 (= (arr!11540 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4725)) mapDefault!16827)))))

(declare-fun call!28429 () ListLongMap!5707)

(declare-fun bm!28427 () Bool)

(assert (=> bm!28427 (= call!28429 (getCurrentListMapNoExtraKeys!1079 (ite c!54839 lt!187990 _keys!709) (ite c!54839 (array!24182 (store (arr!11540 _values!549) i!563 (ValueCellFull!4725 v!412)) (size!11892 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402969 () Bool)

(declare-fun e!242680 () Bool)

(assert (=> b!402969 (= e!242680 (= call!28430 call!28429))))

(declare-fun b!402970 () Bool)

(declare-fun res!232170 () Bool)

(assert (=> b!402970 (=> (not res!232170) (not e!242679))))

(assert (=> b!402970 (= res!232170 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11891 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!402971 () Bool)

(declare-fun res!232173 () Bool)

(assert (=> b!402971 (=> (not res!232173) (not e!242679))))

(declare-datatypes ((List!6716 0))(
  ( (Nil!6713) (Cons!6712 (h!7568 (_ BitVec 64)) (t!11890 List!6716)) )
))
(declare-fun arrayNoDuplicates!0 (array!24179 (_ BitVec 32) List!6716) Bool)

(assert (=> b!402971 (= res!232173 (arrayNoDuplicates!0 lt!187990 #b00000000000000000000000000000000 Nil!6713))))

(declare-fun b!402962 () Bool)

(assert (=> b!402962 (= e!242679 (not true))))

(assert (=> b!402962 e!242680))

(assert (=> b!402962 (= c!54839 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12198 0))(
  ( (Unit!12199) )
))
(declare-fun lt!187991 () Unit!12198)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!357 (array!24179 array!24181 (_ BitVec 32) (_ BitVec 32) V!14621 V!14621 (_ BitVec 32) (_ BitVec 64) V!14621 (_ BitVec 32) Int) Unit!12198)

(assert (=> b!402962 (= lt!187991 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!357 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!232165 () Bool)

(assert (=> start!38718 (=> (not res!232165) (not e!242685))))

(assert (=> start!38718 (= res!232165 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11891 _keys!709))))))

(assert (=> start!38718 e!242685))

(assert (=> start!38718 tp_is_empty!10137))

(assert (=> start!38718 tp!32889))

(assert (=> start!38718 true))

(declare-fun array_inv!8442 (array!24181) Bool)

(assert (=> start!38718 (and (array_inv!8442 _values!549) e!242682)))

(declare-fun array_inv!8443 (array!24179) Bool)

(assert (=> start!38718 (array_inv!8443 _keys!709)))

(declare-fun b!402972 () Bool)

(declare-fun +!1145 (ListLongMap!5707 tuple2!6794) ListLongMap!5707)

(assert (=> b!402972 (= e!242680 (= call!28429 (+!1145 call!28430 (tuple2!6795 k0!794 v!412))))))

(declare-fun b!402973 () Bool)

(declare-fun e!242684 () Bool)

(assert (=> b!402973 (= e!242684 tp_is_empty!10137)))

(declare-fun mapNonEmpty!16827 () Bool)

(declare-fun tp!32888 () Bool)

(assert (=> mapNonEmpty!16827 (= mapRes!16827 (and tp!32888 e!242684))))

(declare-fun mapKey!16827 () (_ BitVec 32))

(declare-fun mapRest!16827 () (Array (_ BitVec 32) ValueCell!4725))

(declare-fun mapValue!16827 () ValueCell!4725)

(assert (=> mapNonEmpty!16827 (= (arr!11540 _values!549) (store mapRest!16827 mapKey!16827 mapValue!16827))))

(declare-fun b!402974 () Bool)

(declare-fun res!232166 () Bool)

(assert (=> b!402974 (=> (not res!232166) (not e!242685))))

(declare-fun arrayContainsKey!0 (array!24179 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!402974 (= res!232166 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!402975 () Bool)

(declare-fun res!232162 () Bool)

(assert (=> b!402975 (=> (not res!232162) (not e!242685))))

(assert (=> b!402975 (= res!232162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!402976 () Bool)

(declare-fun res!232163 () Bool)

(assert (=> b!402976 (=> (not res!232163) (not e!242685))))

(assert (=> b!402976 (= res!232163 (or (= (select (arr!11539 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11539 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!402977 () Bool)

(declare-fun res!232172 () Bool)

(assert (=> b!402977 (=> (not res!232172) (not e!242685))))

(assert (=> b!402977 (= res!232172 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6713))))

(assert (= (and start!38718 res!232165) b!402961))

(assert (= (and b!402961 res!232168) b!402964))

(assert (= (and b!402964 res!232171) b!402975))

(assert (= (and b!402975 res!232162) b!402977))

(assert (= (and b!402977 res!232172) b!402965))

(assert (= (and b!402965 res!232167) b!402966))

(assert (= (and b!402966 res!232164) b!402976))

(assert (= (and b!402976 res!232163) b!402974))

(assert (= (and b!402974 res!232166) b!402963))

(assert (= (and b!402963 res!232169) b!402971))

(assert (= (and b!402971 res!232173) b!402970))

(assert (= (and b!402970 res!232170) b!402962))

(assert (= (and b!402962 c!54839) b!402972))

(assert (= (and b!402962 (not c!54839)) b!402969))

(assert (= (or b!402972 b!402969) bm!28427))

(assert (= (or b!402972 b!402969) bm!28426))

(assert (= (and b!402968 condMapEmpty!16827) mapIsEmpty!16827))

(assert (= (and b!402968 (not condMapEmpty!16827)) mapNonEmpty!16827))

(get-info :version)

(assert (= (and mapNonEmpty!16827 ((_ is ValueCellFull!4725) mapValue!16827)) b!402973))

(assert (= (and b!402968 ((_ is ValueCellFull!4725) mapDefault!16827)) b!402967))

(assert (= start!38718 b!402968))

(declare-fun m!396311 () Bool)

(assert (=> b!402976 m!396311))

(declare-fun m!396313 () Bool)

(assert (=> bm!28426 m!396313))

(declare-fun m!396315 () Bool)

(assert (=> bm!28426 m!396315))

(declare-fun m!396317 () Bool)

(assert (=> b!402972 m!396317))

(declare-fun m!396319 () Bool)

(assert (=> mapNonEmpty!16827 m!396319))

(declare-fun m!396321 () Bool)

(assert (=> b!402966 m!396321))

(declare-fun m!396323 () Bool)

(assert (=> b!402961 m!396323))

(declare-fun m!396325 () Bool)

(assert (=> b!402974 m!396325))

(declare-fun m!396327 () Bool)

(assert (=> b!402975 m!396327))

(assert (=> bm!28427 m!396313))

(declare-fun m!396329 () Bool)

(assert (=> bm!28427 m!396329))

(declare-fun m!396331 () Bool)

(assert (=> b!402971 m!396331))

(declare-fun m!396333 () Bool)

(assert (=> b!402962 m!396333))

(declare-fun m!396335 () Bool)

(assert (=> b!402977 m!396335))

(declare-fun m!396337 () Bool)

(assert (=> start!38718 m!396337))

(declare-fun m!396339 () Bool)

(assert (=> start!38718 m!396339))

(declare-fun m!396341 () Bool)

(assert (=> b!402963 m!396341))

(declare-fun m!396343 () Bool)

(assert (=> b!402963 m!396343))

(check-sat (not b!402962) (not b!402971) (not b!402961) (not mapNonEmpty!16827) (not b!402974) b_and!16641 (not start!38718) tp_is_empty!10137 (not bm!28427) (not b!402972) (not b!402966) (not b!402975) (not bm!28426) (not b!402963) (not b_next!9255) (not b!402977))
(check-sat b_and!16641 (not b_next!9255))
