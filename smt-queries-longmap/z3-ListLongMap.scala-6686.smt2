; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84090 () Bool)

(assert start!84090)

(declare-fun mapNonEmpty!36368 () Bool)

(declare-fun mapRes!36368 () Bool)

(declare-fun tp!69052 () Bool)

(declare-fun e!554247 () Bool)

(assert (=> mapNonEmpty!36368 (= mapRes!36368 (and tp!69052 e!554247))))

(declare-fun mapKey!36368 () (_ BitVec 32))

(declare-datatypes ((V!35507 0))(
  ( (V!35508 (val!11497 Int)) )
))
(declare-datatypes ((ValueCell!10965 0))(
  ( (ValueCellFull!10965 (v!14059 V!35507)) (EmptyCell!10965) )
))
(declare-fun mapRest!36368 () (Array (_ BitVec 32) ValueCell!10965))

(declare-datatypes ((array!61775 0))(
  ( (array!61776 (arr!29745 (Array (_ BitVec 32) ValueCell!10965)) (size!30224 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61775)

(declare-fun mapValue!36368 () ValueCell!10965)

(assert (=> mapNonEmpty!36368 (= (arr!29745 _values!1278) (store mapRest!36368 mapKey!36368 mapValue!36368))))

(declare-fun b!983302 () Bool)

(declare-fun res!658026 () Bool)

(declare-fun e!554249 () Bool)

(assert (=> b!983302 (=> (not res!658026) (not e!554249))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61777 0))(
  ( (array!61778 (arr!29746 (Array (_ BitVec 32) (_ BitVec 64))) (size!30225 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61777)

(assert (=> b!983302 (= res!658026 (and (= (size!30224 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30225 _keys!1544) (size!30224 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!658028 () Bool)

(assert (=> start!84090 (=> (not res!658028) (not e!554249))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84090 (= res!658028 (validMask!0 mask!1948))))

(assert (=> start!84090 e!554249))

(assert (=> start!84090 true))

(declare-fun e!554248 () Bool)

(declare-fun array_inv!22999 (array!61775) Bool)

(assert (=> start!84090 (and (array_inv!22999 _values!1278) e!554248)))

(declare-fun array_inv!23000 (array!61777) Bool)

(assert (=> start!84090 (array_inv!23000 _keys!1544)))

(declare-fun b!983303 () Bool)

(declare-fun e!554250 () Bool)

(declare-fun tp_is_empty!22893 () Bool)

(assert (=> b!983303 (= e!554250 tp_is_empty!22893)))

(declare-fun b!983304 () Bool)

(declare-fun res!658027 () Bool)

(assert (=> b!983304 (=> (not res!658027) (not e!554249))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61777 (_ BitVec 32)) Bool)

(assert (=> b!983304 (= res!658027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!983305 () Bool)

(assert (=> b!983305 (= e!554248 (and e!554250 mapRes!36368))))

(declare-fun condMapEmpty!36368 () Bool)

(declare-fun mapDefault!36368 () ValueCell!10965)

(assert (=> b!983305 (= condMapEmpty!36368 (= (arr!29745 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10965)) mapDefault!36368)))))

(declare-fun mapIsEmpty!36368 () Bool)

(assert (=> mapIsEmpty!36368 mapRes!36368))

(declare-fun b!983306 () Bool)

(assert (=> b!983306 (= e!554249 false)))

(declare-fun lt!436496 () Bool)

(declare-datatypes ((List!20607 0))(
  ( (Nil!20604) (Cons!20603 (h!21765 (_ BitVec 64)) (t!29398 List!20607)) )
))
(declare-fun arrayNoDuplicates!0 (array!61777 (_ BitVec 32) List!20607) Bool)

(assert (=> b!983306 (= lt!436496 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20604))))

(declare-fun b!983307 () Bool)

(assert (=> b!983307 (= e!554247 tp_is_empty!22893)))

(assert (= (and start!84090 res!658028) b!983302))

(assert (= (and b!983302 res!658026) b!983304))

(assert (= (and b!983304 res!658027) b!983306))

(assert (= (and b!983305 condMapEmpty!36368) mapIsEmpty!36368))

(assert (= (and b!983305 (not condMapEmpty!36368)) mapNonEmpty!36368))

(get-info :version)

(assert (= (and mapNonEmpty!36368 ((_ is ValueCellFull!10965) mapValue!36368)) b!983307))

(assert (= (and b!983305 ((_ is ValueCellFull!10965) mapDefault!36368)) b!983303))

(assert (= start!84090 b!983305))

(declare-fun m!910621 () Bool)

(assert (=> mapNonEmpty!36368 m!910621))

(declare-fun m!910623 () Bool)

(assert (=> start!84090 m!910623))

(declare-fun m!910625 () Bool)

(assert (=> start!84090 m!910625))

(declare-fun m!910627 () Bool)

(assert (=> start!84090 m!910627))

(declare-fun m!910629 () Bool)

(assert (=> b!983304 m!910629))

(declare-fun m!910631 () Bool)

(assert (=> b!983306 m!910631))

(check-sat (not mapNonEmpty!36368) (not b!983304) (not b!983306) tp_is_empty!22893 (not start!84090))
(check-sat)
