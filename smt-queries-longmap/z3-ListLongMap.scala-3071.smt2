; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43280 () Bool)

(assert start!43280)

(declare-fun b_free!12147 () Bool)

(declare-fun b_next!12147 () Bool)

(assert (=> start!43280 (= b_free!12147 (not b_next!12147))))

(declare-fun tp!42711 () Bool)

(declare-fun b_and!20899 () Bool)

(assert (=> start!43280 (= tp!42711 b_and!20899)))

(declare-fun b!479510 () Bool)

(declare-fun e!282117 () Bool)

(declare-fun tp_is_empty!13659 () Bool)

(assert (=> b!479510 (= e!282117 tp_is_empty!13659)))

(declare-fun res!286032 () Bool)

(declare-fun e!282119 () Bool)

(assert (=> start!43280 (=> (not res!286032) (not e!282119))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43280 (= res!286032 (validMask!0 mask!2352))))

(assert (=> start!43280 e!282119))

(assert (=> start!43280 true))

(assert (=> start!43280 tp_is_empty!13659))

(declare-datatypes ((V!19283 0))(
  ( (V!19284 (val!6877 Int)) )
))
(declare-datatypes ((ValueCell!6468 0))(
  ( (ValueCellFull!6468 (v!9166 V!19283)) (EmptyCell!6468) )
))
(declare-datatypes ((array!30989 0))(
  ( (array!30990 (arr!14901 (Array (_ BitVec 32) ValueCell!6468)) (size!15259 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30989)

(declare-fun e!282118 () Bool)

(declare-fun array_inv!10748 (array!30989) Bool)

(assert (=> start!43280 (and (array_inv!10748 _values!1516) e!282118)))

(assert (=> start!43280 tp!42711))

(declare-datatypes ((array!30991 0))(
  ( (array!30992 (arr!14902 (Array (_ BitVec 32) (_ BitVec 64))) (size!15260 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30991)

(declare-fun array_inv!10749 (array!30991) Bool)

(assert (=> start!43280 (array_inv!10749 _keys!1874)))

(declare-fun b!479511 () Bool)

(declare-fun e!282116 () Bool)

(declare-fun mapRes!22186 () Bool)

(assert (=> b!479511 (= e!282118 (and e!282116 mapRes!22186))))

(declare-fun condMapEmpty!22186 () Bool)

(declare-fun mapDefault!22186 () ValueCell!6468)

(assert (=> b!479511 (= condMapEmpty!22186 (= (arr!14901 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6468)) mapDefault!22186)))))

(declare-fun b!479512 () Bool)

(declare-fun res!286029 () Bool)

(assert (=> b!479512 (=> (not res!286029) (not e!282119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30991 (_ BitVec 32)) Bool)

(assert (=> b!479512 (= res!286029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!479513 () Bool)

(declare-fun res!286031 () Bool)

(assert (=> b!479513 (=> (not res!286031) (not e!282119))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!479513 (= res!286031 (and (= (size!15259 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15260 _keys!1874) (size!15259 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!479514 () Bool)

(assert (=> b!479514 (= e!282116 tp_is_empty!13659)))

(declare-fun b!479515 () Bool)

(declare-fun res!286030 () Bool)

(assert (=> b!479515 (=> (not res!286030) (not e!282119))))

(declare-datatypes ((List!9103 0))(
  ( (Nil!9100) (Cons!9099 (h!9955 (_ BitVec 64)) (t!15309 List!9103)) )
))
(declare-fun arrayNoDuplicates!0 (array!30991 (_ BitVec 32) List!9103) Bool)

(assert (=> b!479515 (= res!286030 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9100))))

(declare-fun mapIsEmpty!22186 () Bool)

(assert (=> mapIsEmpty!22186 mapRes!22186))

(declare-fun mapNonEmpty!22186 () Bool)

(declare-fun tp!42712 () Bool)

(assert (=> mapNonEmpty!22186 (= mapRes!22186 (and tp!42712 e!282117))))

(declare-fun mapValue!22186 () ValueCell!6468)

(declare-fun mapRest!22186 () (Array (_ BitVec 32) ValueCell!6468))

(declare-fun mapKey!22186 () (_ BitVec 32))

(assert (=> mapNonEmpty!22186 (= (arr!14901 _values!1516) (store mapRest!22186 mapKey!22186 mapValue!22186))))

(declare-fun b!479516 () Bool)

(assert (=> b!479516 (= e!282119 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun lt!217873 () Bool)

(declare-fun minValue!1458 () V!19283)

(declare-fun zeroValue!1458 () V!19283)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9024 0))(
  ( (tuple2!9025 (_1!4523 (_ BitVec 64)) (_2!4523 V!19283)) )
))
(declare-datatypes ((List!9104 0))(
  ( (Nil!9101) (Cons!9100 (h!9956 tuple2!9024) (t!15310 List!9104)) )
))
(declare-datatypes ((ListLongMap!7937 0))(
  ( (ListLongMap!7938 (toList!3984 List!9104)) )
))
(declare-fun contains!2594 (ListLongMap!7937 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2303 (array!30991 array!30989 (_ BitVec 32) (_ BitVec 32) V!19283 V!19283 (_ BitVec 32) Int) ListLongMap!7937)

(assert (=> b!479516 (= lt!217873 (contains!2594 (getCurrentListMap!2303 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(assert (= (and start!43280 res!286032) b!479513))

(assert (= (and b!479513 res!286031) b!479512))

(assert (= (and b!479512 res!286029) b!479515))

(assert (= (and b!479515 res!286030) b!479516))

(assert (= (and b!479511 condMapEmpty!22186) mapIsEmpty!22186))

(assert (= (and b!479511 (not condMapEmpty!22186)) mapNonEmpty!22186))

(get-info :version)

(assert (= (and mapNonEmpty!22186 ((_ is ValueCellFull!6468) mapValue!22186)) b!479510))

(assert (= (and b!479511 ((_ is ValueCellFull!6468) mapDefault!22186)) b!479514))

(assert (= start!43280 b!479511))

(declare-fun m!461439 () Bool)

(assert (=> b!479516 m!461439))

(assert (=> b!479516 m!461439))

(declare-fun m!461441 () Bool)

(assert (=> b!479516 m!461441))

(declare-fun m!461443 () Bool)

(assert (=> b!479515 m!461443))

(declare-fun m!461445 () Bool)

(assert (=> b!479512 m!461445))

(declare-fun m!461447 () Bool)

(assert (=> mapNonEmpty!22186 m!461447))

(declare-fun m!461449 () Bool)

(assert (=> start!43280 m!461449))

(declare-fun m!461451 () Bool)

(assert (=> start!43280 m!461451))

(declare-fun m!461453 () Bool)

(assert (=> start!43280 m!461453))

(check-sat (not mapNonEmpty!22186) tp_is_empty!13659 (not b!479515) (not start!43280) b_and!20899 (not b!479516) (not b!479512) (not b_next!12147))
(check-sat b_and!20899 (not b_next!12147))
