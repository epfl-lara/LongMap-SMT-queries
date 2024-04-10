; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77470 () Bool)

(assert start!77470)

(declare-fun mapIsEmpty!29434 () Bool)

(declare-fun mapRes!29434 () Bool)

(assert (=> mapIsEmpty!29434 mapRes!29434))

(declare-fun b!902812 () Bool)

(declare-fun res!609202 () Bool)

(declare-fun e!505713 () Bool)

(assert (=> b!902812 (=> (not res!609202) (not e!505713))))

(declare-datatypes ((array!53026 0))(
  ( (array!53027 (arr!25473 (Array (_ BitVec 32) (_ BitVec 64))) (size!25932 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53026)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53026 (_ BitVec 32)) Bool)

(assert (=> b!902812 (= res!609202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!902813 () Bool)

(declare-fun e!505710 () Bool)

(declare-fun e!505711 () Bool)

(assert (=> b!902813 (= e!505710 (and e!505711 mapRes!29434))))

(declare-fun condMapEmpty!29434 () Bool)

(declare-datatypes ((V!29609 0))(
  ( (V!29610 (val!9292 Int)) )
))
(declare-datatypes ((ValueCell!8760 0))(
  ( (ValueCellFull!8760 (v!11797 V!29609)) (EmptyCell!8760) )
))
(declare-datatypes ((array!53028 0))(
  ( (array!53029 (arr!25474 (Array (_ BitVec 32) ValueCell!8760)) (size!25933 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53028)

(declare-fun mapDefault!29434 () ValueCell!8760)

(assert (=> b!902813 (= condMapEmpty!29434 (= (arr!25474 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8760)) mapDefault!29434)))))

(declare-fun b!902814 () Bool)

(declare-fun tp_is_empty!18483 () Bool)

(assert (=> b!902814 (= e!505711 tp_is_empty!18483)))

(declare-fun res!609203 () Bool)

(assert (=> start!77470 (=> (not res!609203) (not e!505713))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77470 (= res!609203 (validMask!0 mask!1756))))

(assert (=> start!77470 e!505713))

(assert (=> start!77470 true))

(declare-fun array_inv!19968 (array!53028) Bool)

(assert (=> start!77470 (and (array_inv!19968 _values!1152) e!505710)))

(declare-fun array_inv!19969 (array!53026) Bool)

(assert (=> start!77470 (array_inv!19969 _keys!1386)))

(declare-fun mapNonEmpty!29434 () Bool)

(declare-fun tp!56493 () Bool)

(declare-fun e!505709 () Bool)

(assert (=> mapNonEmpty!29434 (= mapRes!29434 (and tp!56493 e!505709))))

(declare-fun mapRest!29434 () (Array (_ BitVec 32) ValueCell!8760))

(declare-fun mapValue!29434 () ValueCell!8760)

(declare-fun mapKey!29434 () (_ BitVec 32))

(assert (=> mapNonEmpty!29434 (= (arr!25474 _values!1152) (store mapRest!29434 mapKey!29434 mapValue!29434))))

(declare-fun b!902815 () Bool)

(assert (=> b!902815 (= e!505713 false)))

(declare-fun lt!407919 () Bool)

(declare-datatypes ((List!17894 0))(
  ( (Nil!17891) (Cons!17890 (h!19036 (_ BitVec 64)) (t!25277 List!17894)) )
))
(declare-fun arrayNoDuplicates!0 (array!53026 (_ BitVec 32) List!17894) Bool)

(assert (=> b!902815 (= lt!407919 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17891))))

(declare-fun b!902816 () Bool)

(assert (=> b!902816 (= e!505709 tp_is_empty!18483)))

(declare-fun b!902817 () Bool)

(declare-fun res!609201 () Bool)

(assert (=> b!902817 (=> (not res!609201) (not e!505713))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!902817 (= res!609201 (and (= (size!25933 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25932 _keys!1386) (size!25933 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(assert (= (and start!77470 res!609203) b!902817))

(assert (= (and b!902817 res!609201) b!902812))

(assert (= (and b!902812 res!609202) b!902815))

(assert (= (and b!902813 condMapEmpty!29434) mapIsEmpty!29434))

(assert (= (and b!902813 (not condMapEmpty!29434)) mapNonEmpty!29434))

(get-info :version)

(assert (= (and mapNonEmpty!29434 ((_ is ValueCellFull!8760) mapValue!29434)) b!902816))

(assert (= (and b!902813 ((_ is ValueCellFull!8760) mapDefault!29434)) b!902814))

(assert (= start!77470 b!902813))

(declare-fun m!838687 () Bool)

(assert (=> b!902812 m!838687))

(declare-fun m!838689 () Bool)

(assert (=> start!77470 m!838689))

(declare-fun m!838691 () Bool)

(assert (=> start!77470 m!838691))

(declare-fun m!838693 () Bool)

(assert (=> start!77470 m!838693))

(declare-fun m!838695 () Bool)

(assert (=> mapNonEmpty!29434 m!838695))

(declare-fun m!838697 () Bool)

(assert (=> b!902815 m!838697))

(check-sat (not mapNonEmpty!29434) (not b!902812) (not b!902815) (not start!77470) tp_is_empty!18483)
(check-sat)
