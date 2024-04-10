; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21212 () Bool)

(assert start!21212)

(declare-fun b_free!5643 () Bool)

(declare-fun b_next!5643 () Bool)

(assert (=> start!21212 (= b_free!5643 (not b_next!5643))))

(declare-fun tp!20003 () Bool)

(declare-fun b_and!12521 () Bool)

(assert (=> start!21212 (= tp!20003 b_and!12521)))

(declare-fun b!213704 () Bool)

(declare-fun res!104617 () Bool)

(declare-fun e!138970 () Bool)

(assert (=> b!213704 (=> (not res!104617) (not e!138970))))

(declare-datatypes ((array!10215 0))(
  ( (array!10216 (arr!4847 (Array (_ BitVec 32) (_ BitVec 64))) (size!5172 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10215)

(declare-datatypes ((List!3120 0))(
  ( (Nil!3117) (Cons!3116 (h!3758 (_ BitVec 64)) (t!8073 List!3120)) )
))
(declare-fun arrayNoDuplicates!0 (array!10215 (_ BitVec 32) List!3120) Bool)

(assert (=> b!213704 (= res!104617 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3117))))

(declare-fun b!213705 () Bool)

(declare-fun res!104616 () Bool)

(assert (=> b!213705 (=> (not res!104616) (not e!138970))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!213705 (= res!104616 (validKeyInArray!0 k0!843))))

(declare-fun b!213706 () Bool)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6987 0))(
  ( (V!6988 (val!2797 Int)) )
))
(declare-datatypes ((tuple2!4236 0))(
  ( (tuple2!4237 (_1!2129 (_ BitVec 64)) (_2!2129 V!6987)) )
))
(declare-datatypes ((List!3121 0))(
  ( (Nil!3118) (Cons!3117 (h!3759 tuple2!4236) (t!8074 List!3121)) )
))
(declare-datatypes ((ListLongMap!3149 0))(
  ( (ListLongMap!3150 (toList!1590 List!3121)) )
))
(declare-fun lt!110510 () ListLongMap!3149)

(declare-datatypes ((ValueCell!2409 0))(
  ( (ValueCellFull!2409 (v!4811 V!6987)) (EmptyCell!2409) )
))
(declare-datatypes ((array!10217 0))(
  ( (array!10218 (arr!4848 (Array (_ BitVec 32) ValueCell!2409)) (size!5173 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10217)

(declare-fun lt!110512 () Bool)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lt!110517 () ListLongMap!3149)

(assert (=> b!213706 (= e!138970 (not (or (and (not lt!110512) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!110512) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!110512) (not (= lt!110510 lt!110517)) (bvslt i!601 (size!5173 _values!649)))))))

(assert (=> b!213706 (= lt!110512 (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun zeroValue!615 () V!6987)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6987)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun lt!110514 () ListLongMap!3149)

(declare-fun getCurrentListMap!1118 (array!10215 array!10217 (_ BitVec 32) (_ BitVec 32) V!6987 V!6987 (_ BitVec 32) Int) ListLongMap!3149)

(assert (=> b!213706 (= lt!110514 (getCurrentListMap!1118 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110515 () array!10217)

(assert (=> b!213706 (= lt!110510 (getCurrentListMap!1118 _keys!825 lt!110515 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110513 () ListLongMap!3149)

(assert (=> b!213706 (and (= lt!110517 lt!110513) (= lt!110513 lt!110517))))

(declare-fun lt!110511 () ListLongMap!3149)

(declare-fun v!520 () V!6987)

(declare-fun +!593 (ListLongMap!3149 tuple2!4236) ListLongMap!3149)

(assert (=> b!213706 (= lt!110513 (+!593 lt!110511 (tuple2!4237 k0!843 v!520)))))

(declare-datatypes ((Unit!6480 0))(
  ( (Unit!6481) )
))
(declare-fun lt!110516 () Unit!6480)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!235 (array!10215 array!10217 (_ BitVec 32) (_ BitVec 32) V!6987 V!6987 (_ BitVec 32) (_ BitVec 64) V!6987 (_ BitVec 32) Int) Unit!6480)

(assert (=> b!213706 (= lt!110516 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!235 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!520 (array!10215 array!10217 (_ BitVec 32) (_ BitVec 32) V!6987 V!6987 (_ BitVec 32) Int) ListLongMap!3149)

(assert (=> b!213706 (= lt!110517 (getCurrentListMapNoExtraKeys!520 _keys!825 lt!110515 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!213706 (= lt!110515 (array!10218 (store (arr!4848 _values!649) i!601 (ValueCellFull!2409 v!520)) (size!5173 _values!649)))))

(assert (=> b!213706 (= lt!110511 (getCurrentListMapNoExtraKeys!520 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!213707 () Bool)

(declare-fun res!104611 () Bool)

(assert (=> b!213707 (=> (not res!104611) (not e!138970))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10215 (_ BitVec 32)) Bool)

(assert (=> b!213707 (= res!104611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!9359 () Bool)

(declare-fun mapRes!9359 () Bool)

(assert (=> mapIsEmpty!9359 mapRes!9359))

(declare-fun b!213708 () Bool)

(declare-fun res!104613 () Bool)

(assert (=> b!213708 (=> (not res!104613) (not e!138970))))

(assert (=> b!213708 (= res!104613 (= (select (arr!4847 _keys!825) i!601) k0!843))))

(declare-fun b!213709 () Bool)

(declare-fun e!138969 () Bool)

(declare-fun tp_is_empty!5505 () Bool)

(assert (=> b!213709 (= e!138969 tp_is_empty!5505)))

(declare-fun b!213710 () Bool)

(declare-fun e!138971 () Bool)

(assert (=> b!213710 (= e!138971 (and e!138969 mapRes!9359))))

(declare-fun condMapEmpty!9359 () Bool)

(declare-fun mapDefault!9359 () ValueCell!2409)

(assert (=> b!213710 (= condMapEmpty!9359 (= (arr!4848 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2409)) mapDefault!9359)))))

(declare-fun res!104614 () Bool)

(assert (=> start!21212 (=> (not res!104614) (not e!138970))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21212 (= res!104614 (validMask!0 mask!1149))))

(assert (=> start!21212 e!138970))

(declare-fun array_inv!3205 (array!10217) Bool)

(assert (=> start!21212 (and (array_inv!3205 _values!649) e!138971)))

(assert (=> start!21212 true))

(assert (=> start!21212 tp_is_empty!5505))

(declare-fun array_inv!3206 (array!10215) Bool)

(assert (=> start!21212 (array_inv!3206 _keys!825)))

(assert (=> start!21212 tp!20003))

(declare-fun mapNonEmpty!9359 () Bool)

(declare-fun tp!20002 () Bool)

(declare-fun e!138968 () Bool)

(assert (=> mapNonEmpty!9359 (= mapRes!9359 (and tp!20002 e!138968))))

(declare-fun mapKey!9359 () (_ BitVec 32))

(declare-fun mapRest!9359 () (Array (_ BitVec 32) ValueCell!2409))

(declare-fun mapValue!9359 () ValueCell!2409)

(assert (=> mapNonEmpty!9359 (= (arr!4848 _values!649) (store mapRest!9359 mapKey!9359 mapValue!9359))))

(declare-fun b!213711 () Bool)

(declare-fun res!104612 () Bool)

(assert (=> b!213711 (=> (not res!104612) (not e!138970))))

(assert (=> b!213711 (= res!104612 (and (= (size!5173 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5172 _keys!825) (size!5173 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!213712 () Bool)

(declare-fun res!104615 () Bool)

(assert (=> b!213712 (=> (not res!104615) (not e!138970))))

(assert (=> b!213712 (= res!104615 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5172 _keys!825))))))

(declare-fun b!213713 () Bool)

(assert (=> b!213713 (= e!138968 tp_is_empty!5505)))

(assert (= (and start!21212 res!104614) b!213711))

(assert (= (and b!213711 res!104612) b!213707))

(assert (= (and b!213707 res!104611) b!213704))

(assert (= (and b!213704 res!104617) b!213712))

(assert (= (and b!213712 res!104615) b!213705))

(assert (= (and b!213705 res!104616) b!213708))

(assert (= (and b!213708 res!104613) b!213706))

(assert (= (and b!213710 condMapEmpty!9359) mapIsEmpty!9359))

(assert (= (and b!213710 (not condMapEmpty!9359)) mapNonEmpty!9359))

(get-info :version)

(assert (= (and mapNonEmpty!9359 ((_ is ValueCellFull!2409) mapValue!9359)) b!213713))

(assert (= (and b!213710 ((_ is ValueCellFull!2409) mapDefault!9359)) b!213709))

(assert (= start!21212 b!213710))

(declare-fun m!241573 () Bool)

(assert (=> b!213708 m!241573))

(declare-fun m!241575 () Bool)

(assert (=> b!213706 m!241575))

(declare-fun m!241577 () Bool)

(assert (=> b!213706 m!241577))

(declare-fun m!241579 () Bool)

(assert (=> b!213706 m!241579))

(declare-fun m!241581 () Bool)

(assert (=> b!213706 m!241581))

(declare-fun m!241583 () Bool)

(assert (=> b!213706 m!241583))

(declare-fun m!241585 () Bool)

(assert (=> b!213706 m!241585))

(declare-fun m!241587 () Bool)

(assert (=> b!213706 m!241587))

(declare-fun m!241589 () Bool)

(assert (=> b!213707 m!241589))

(declare-fun m!241591 () Bool)

(assert (=> b!213705 m!241591))

(declare-fun m!241593 () Bool)

(assert (=> b!213704 m!241593))

(declare-fun m!241595 () Bool)

(assert (=> mapNonEmpty!9359 m!241595))

(declare-fun m!241597 () Bool)

(assert (=> start!21212 m!241597))

(declare-fun m!241599 () Bool)

(assert (=> start!21212 m!241599))

(declare-fun m!241601 () Bool)

(assert (=> start!21212 m!241601))

(check-sat (not b!213706) (not start!21212) (not b!213704) tp_is_empty!5505 (not b!213707) b_and!12521 (not mapNonEmpty!9359) (not b_next!5643) (not b!213705))
(check-sat b_and!12521 (not b_next!5643))
