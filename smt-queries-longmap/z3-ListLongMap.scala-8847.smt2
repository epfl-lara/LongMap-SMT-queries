; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107530 () Bool)

(assert start!107530)

(declare-fun b!1273082 () Bool)

(declare-fun e!726143 () Bool)

(assert (=> b!1273082 (= e!726143 false)))

(declare-fun lt!575413 () Bool)

(declare-datatypes ((array!83257 0))(
  ( (array!83258 (arr!40161 (Array (_ BitVec 32) (_ BitVec 64))) (size!40698 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83257)

(declare-datatypes ((List!28565 0))(
  ( (Nil!28562) (Cons!28561 (h!29779 (_ BitVec 64)) (t!42086 List!28565)) )
))
(declare-fun arrayNoDuplicates!0 (array!83257 (_ BitVec 32) List!28565) Bool)

(assert (=> b!1273082 (= lt!575413 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28562))))

(declare-fun b!1273083 () Bool)

(declare-fun res!846601 () Bool)

(assert (=> b!1273083 (=> (not res!846601) (not e!726143))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83257 (_ BitVec 32)) Bool)

(assert (=> b!1273083 (= res!846601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1273084 () Bool)

(declare-fun e!726144 () Bool)

(declare-fun tp_is_empty!32995 () Bool)

(assert (=> b!1273084 (= e!726144 tp_is_empty!32995)))

(declare-fun b!1273085 () Bool)

(declare-fun e!726145 () Bool)

(assert (=> b!1273085 (= e!726145 tp_is_empty!32995)))

(declare-fun b!1273086 () Bool)

(declare-fun res!846602 () Bool)

(assert (=> b!1273086 (=> (not res!846602) (not e!726143))))

(declare-datatypes ((V!49187 0))(
  ( (V!49188 (val!16572 Int)) )
))
(declare-datatypes ((ValueCell!15644 0))(
  ( (ValueCellFull!15644 (v!19204 V!49187)) (EmptyCell!15644) )
))
(declare-datatypes ((array!83259 0))(
  ( (array!83260 (arr!40162 (Array (_ BitVec 32) ValueCell!15644)) (size!40699 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83259)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(assert (=> b!1273086 (= res!846602 (and (= (size!40699 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40698 _keys!1364) (size!40699 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!51073 () Bool)

(declare-fun mapRes!51073 () Bool)

(declare-fun tp!97414 () Bool)

(assert (=> mapNonEmpty!51073 (= mapRes!51073 (and tp!97414 e!726144))))

(declare-fun mapRest!51073 () (Array (_ BitVec 32) ValueCell!15644))

(declare-fun mapKey!51073 () (_ BitVec 32))

(declare-fun mapValue!51073 () ValueCell!15644)

(assert (=> mapNonEmpty!51073 (= (arr!40162 _values!1134) (store mapRest!51073 mapKey!51073 mapValue!51073))))

(declare-fun mapIsEmpty!51073 () Bool)

(assert (=> mapIsEmpty!51073 mapRes!51073))

(declare-fun res!846603 () Bool)

(assert (=> start!107530 (=> (not res!846603) (not e!726143))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107530 (= res!846603 (validMask!0 mask!1730))))

(assert (=> start!107530 e!726143))

(declare-fun e!726142 () Bool)

(declare-fun array_inv!30709 (array!83259) Bool)

(assert (=> start!107530 (and (array_inv!30709 _values!1134) e!726142)))

(assert (=> start!107530 true))

(declare-fun array_inv!30710 (array!83257) Bool)

(assert (=> start!107530 (array_inv!30710 _keys!1364)))

(declare-fun b!1273087 () Bool)

(assert (=> b!1273087 (= e!726142 (and e!726145 mapRes!51073))))

(declare-fun condMapEmpty!51073 () Bool)

(declare-fun mapDefault!51073 () ValueCell!15644)

(assert (=> b!1273087 (= condMapEmpty!51073 (= (arr!40162 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15644)) mapDefault!51073)))))

(assert (= (and start!107530 res!846603) b!1273086))

(assert (= (and b!1273086 res!846602) b!1273083))

(assert (= (and b!1273083 res!846601) b!1273082))

(assert (= (and b!1273087 condMapEmpty!51073) mapIsEmpty!51073))

(assert (= (and b!1273087 (not condMapEmpty!51073)) mapNonEmpty!51073))

(get-info :version)

(assert (= (and mapNonEmpty!51073 ((_ is ValueCellFull!15644) mapValue!51073)) b!1273084))

(assert (= (and b!1273087 ((_ is ValueCellFull!15644) mapDefault!51073)) b!1273085))

(assert (= start!107530 b!1273087))

(declare-fun m!1171227 () Bool)

(assert (=> b!1273082 m!1171227))

(declare-fun m!1171229 () Bool)

(assert (=> b!1273083 m!1171229))

(declare-fun m!1171231 () Bool)

(assert (=> mapNonEmpty!51073 m!1171231))

(declare-fun m!1171233 () Bool)

(assert (=> start!107530 m!1171233))

(declare-fun m!1171235 () Bool)

(assert (=> start!107530 m!1171235))

(declare-fun m!1171237 () Bool)

(assert (=> start!107530 m!1171237))

(check-sat (not b!1273083) (not b!1273082) tp_is_empty!32995 (not mapNonEmpty!51073) (not start!107530))
(check-sat)
