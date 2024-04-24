; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84286 () Bool)

(assert start!84286)

(declare-fun b!984457 () Bool)

(declare-fun res!658498 () Bool)

(declare-fun e!555040 () Bool)

(assert (=> b!984457 (=> (not res!658498) (not e!555040))))

(declare-datatypes ((array!61866 0))(
  ( (array!61867 (arr!29786 (Array (_ BitVec 32) (_ BitVec 64))) (size!30266 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61866)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61866 (_ BitVec 32)) Bool)

(assert (=> b!984457 (= res!658498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!984458 () Bool)

(assert (=> b!984458 (= e!555040 false)))

(declare-fun lt!436899 () Bool)

(declare-datatypes ((List!20631 0))(
  ( (Nil!20628) (Cons!20627 (h!21795 (_ BitVec 64)) (t!29414 List!20631)) )
))
(declare-fun arrayNoDuplicates!0 (array!61866 (_ BitVec 32) List!20631) Bool)

(assert (=> b!984458 (= lt!436899 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20628))))

(declare-fun res!658496 () Bool)

(assert (=> start!84286 (=> (not res!658496) (not e!555040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84286 (= res!658496 (validMask!0 mask!1948))))

(assert (=> start!84286 e!555040))

(assert (=> start!84286 true))

(declare-datatypes ((V!35545 0))(
  ( (V!35546 (val!11511 Int)) )
))
(declare-datatypes ((ValueCell!10979 0))(
  ( (ValueCellFull!10979 (v!14070 V!35545)) (EmptyCell!10979) )
))
(declare-datatypes ((array!61868 0))(
  ( (array!61869 (arr!29787 (Array (_ BitVec 32) ValueCell!10979)) (size!30267 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61868)

(declare-fun e!555039 () Bool)

(declare-fun array_inv!23045 (array!61868) Bool)

(assert (=> start!84286 (and (array_inv!23045 _values!1278) e!555039)))

(declare-fun array_inv!23046 (array!61866) Bool)

(assert (=> start!84286 (array_inv!23046 _keys!1544)))

(declare-fun mapNonEmpty!36410 () Bool)

(declare-fun mapRes!36410 () Bool)

(declare-fun tp!69095 () Bool)

(declare-fun e!555041 () Bool)

(assert (=> mapNonEmpty!36410 (= mapRes!36410 (and tp!69095 e!555041))))

(declare-fun mapValue!36410 () ValueCell!10979)

(declare-fun mapKey!36410 () (_ BitVec 32))

(declare-fun mapRest!36410 () (Array (_ BitVec 32) ValueCell!10979))

(assert (=> mapNonEmpty!36410 (= (arr!29787 _values!1278) (store mapRest!36410 mapKey!36410 mapValue!36410))))

(declare-fun b!984459 () Bool)

(declare-fun res!658497 () Bool)

(assert (=> b!984459 (=> (not res!658497) (not e!555040))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!984459 (= res!658497 (and (= (size!30267 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30266 _keys!1544) (size!30267 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!984460 () Bool)

(declare-fun tp_is_empty!22921 () Bool)

(assert (=> b!984460 (= e!555041 tp_is_empty!22921)))

(declare-fun b!984461 () Bool)

(declare-fun e!555038 () Bool)

(assert (=> b!984461 (= e!555039 (and e!555038 mapRes!36410))))

(declare-fun condMapEmpty!36410 () Bool)

(declare-fun mapDefault!36410 () ValueCell!10979)

(assert (=> b!984461 (= condMapEmpty!36410 (= (arr!29787 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10979)) mapDefault!36410)))))

(declare-fun b!984462 () Bool)

(assert (=> b!984462 (= e!555038 tp_is_empty!22921)))

(declare-fun mapIsEmpty!36410 () Bool)

(assert (=> mapIsEmpty!36410 mapRes!36410))

(assert (= (and start!84286 res!658496) b!984459))

(assert (= (and b!984459 res!658497) b!984457))

(assert (= (and b!984457 res!658498) b!984458))

(assert (= (and b!984461 condMapEmpty!36410) mapIsEmpty!36410))

(assert (= (and b!984461 (not condMapEmpty!36410)) mapNonEmpty!36410))

(get-info :version)

(assert (= (and mapNonEmpty!36410 ((_ is ValueCellFull!10979) mapValue!36410)) b!984460))

(assert (= (and b!984461 ((_ is ValueCellFull!10979) mapDefault!36410)) b!984462))

(assert (= start!84286 b!984461))

(declare-fun m!912083 () Bool)

(assert (=> b!984457 m!912083))

(declare-fun m!912085 () Bool)

(assert (=> b!984458 m!912085))

(declare-fun m!912087 () Bool)

(assert (=> start!84286 m!912087))

(declare-fun m!912089 () Bool)

(assert (=> start!84286 m!912089))

(declare-fun m!912091 () Bool)

(assert (=> start!84286 m!912091))

(declare-fun m!912093 () Bool)

(assert (=> mapNonEmpty!36410 m!912093))

(check-sat tp_is_empty!22921 (not start!84286) (not mapNonEmpty!36410) (not b!984457) (not b!984458))
(check-sat)
