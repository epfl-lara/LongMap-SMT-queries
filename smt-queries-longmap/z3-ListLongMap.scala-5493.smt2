; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72724 () Bool)

(assert start!72724)

(declare-fun res!573518 () Bool)

(declare-fun e!471035 () Bool)

(assert (=> start!72724 (=> (not res!573518) (not e!471035))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47817 0))(
  ( (array!47818 (arr!22940 (Array (_ BitVec 32) (_ BitVec 64))) (size!23382 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47817)

(assert (=> start!72724 (= res!573518 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23382 _keys!868))))))

(assert (=> start!72724 e!471035))

(assert (=> start!72724 true))

(declare-fun array_inv!18314 (array!47817) Bool)

(assert (=> start!72724 (array_inv!18314 _keys!868)))

(declare-datatypes ((V!26105 0))(
  ( (V!26106 (val!7944 Int)) )
))
(declare-datatypes ((ValueCell!7457 0))(
  ( (ValueCellFull!7457 (v!10363 V!26105)) (EmptyCell!7457) )
))
(declare-datatypes ((array!47819 0))(
  ( (array!47820 (arr!22941 (Array (_ BitVec 32) ValueCell!7457)) (size!23383 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47819)

(declare-fun e!471037 () Bool)

(declare-fun array_inv!18315 (array!47819) Bool)

(assert (=> start!72724 (and (array_inv!18315 _values!688) e!471037)))

(declare-fun b!844017 () Bool)

(assert (=> b!844017 (= e!471035 false)))

(declare-fun lt!381020 () Bool)

(declare-datatypes ((List!16282 0))(
  ( (Nil!16279) (Cons!16278 (h!17409 (_ BitVec 64)) (t!22644 List!16282)) )
))
(declare-fun arrayNoDuplicates!0 (array!47817 (_ BitVec 32) List!16282) Bool)

(assert (=> b!844017 (= lt!381020 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16279))))

(declare-fun mapIsEmpty!25289 () Bool)

(declare-fun mapRes!25289 () Bool)

(assert (=> mapIsEmpty!25289 mapRes!25289))

(declare-fun mapNonEmpty!25289 () Bool)

(declare-fun tp!48608 () Bool)

(declare-fun e!471036 () Bool)

(assert (=> mapNonEmpty!25289 (= mapRes!25289 (and tp!48608 e!471036))))

(declare-fun mapKey!25289 () (_ BitVec 32))

(declare-fun mapValue!25289 () ValueCell!7457)

(declare-fun mapRest!25289 () (Array (_ BitVec 32) ValueCell!7457))

(assert (=> mapNonEmpty!25289 (= (arr!22941 _values!688) (store mapRest!25289 mapKey!25289 mapValue!25289))))

(declare-fun b!844018 () Bool)

(declare-fun tp_is_empty!15793 () Bool)

(assert (=> b!844018 (= e!471036 tp_is_empty!15793)))

(declare-fun b!844019 () Bool)

(declare-fun res!573519 () Bool)

(assert (=> b!844019 (=> (not res!573519) (not e!471035))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844019 (= res!573519 (validMask!0 mask!1196))))

(declare-fun b!844020 () Bool)

(declare-fun res!573516 () Bool)

(assert (=> b!844020 (=> (not res!573516) (not e!471035))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47817 (_ BitVec 32)) Bool)

(assert (=> b!844020 (= res!573516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!844021 () Bool)

(declare-fun e!471038 () Bool)

(assert (=> b!844021 (= e!471037 (and e!471038 mapRes!25289))))

(declare-fun condMapEmpty!25289 () Bool)

(declare-fun mapDefault!25289 () ValueCell!7457)

(assert (=> b!844021 (= condMapEmpty!25289 (= (arr!22941 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7457)) mapDefault!25289)))))

(declare-fun b!844022 () Bool)

(declare-fun res!573517 () Bool)

(assert (=> b!844022 (=> (not res!573517) (not e!471035))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!844022 (= res!573517 (and (= (size!23383 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23382 _keys!868) (size!23383 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844023 () Bool)

(assert (=> b!844023 (= e!471038 tp_is_empty!15793)))

(assert (= (and start!72724 res!573518) b!844019))

(assert (= (and b!844019 res!573519) b!844022))

(assert (= (and b!844022 res!573517) b!844020))

(assert (= (and b!844020 res!573516) b!844017))

(assert (= (and b!844021 condMapEmpty!25289) mapIsEmpty!25289))

(assert (= (and b!844021 (not condMapEmpty!25289)) mapNonEmpty!25289))

(get-info :version)

(assert (= (and mapNonEmpty!25289 ((_ is ValueCellFull!7457) mapValue!25289)) b!844018))

(assert (= (and b!844021 ((_ is ValueCellFull!7457) mapDefault!25289)) b!844023))

(assert (= start!72724 b!844021))

(declare-fun m!785831 () Bool)

(assert (=> b!844017 m!785831))

(declare-fun m!785833 () Bool)

(assert (=> b!844020 m!785833))

(declare-fun m!785835 () Bool)

(assert (=> start!72724 m!785835))

(declare-fun m!785837 () Bool)

(assert (=> start!72724 m!785837))

(declare-fun m!785839 () Bool)

(assert (=> mapNonEmpty!25289 m!785839))

(declare-fun m!785841 () Bool)

(assert (=> b!844019 m!785841))

(check-sat (not b!844019) (not mapNonEmpty!25289) (not b!844017) (not b!844020) (not start!72724) tp_is_empty!15793)
(check-sat)
