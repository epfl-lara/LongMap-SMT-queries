; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107144 () Bool)

(assert start!107144)

(declare-fun b!1270255 () Bool)

(declare-fun e!724051 () Bool)

(declare-fun e!724054 () Bool)

(declare-fun mapRes!50830 () Bool)

(assert (=> b!1270255 (= e!724051 (and e!724054 mapRes!50830))))

(declare-fun condMapEmpty!50830 () Bool)

(declare-datatypes ((V!48971 0))(
  ( (V!48972 (val!16491 Int)) )
))
(declare-datatypes ((ValueCell!15563 0))(
  ( (ValueCellFull!15563 (v!19127 V!48971)) (EmptyCell!15563) )
))
(declare-datatypes ((array!82839 0))(
  ( (array!82840 (arr!39957 (Array (_ BitVec 32) ValueCell!15563)) (size!40495 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82839)

(declare-fun mapDefault!50830 () ValueCell!15563)

(assert (=> b!1270255 (= condMapEmpty!50830 (= (arr!39957 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15563)) mapDefault!50830)))))

(declare-fun b!1270256 () Bool)

(declare-fun e!724053 () Bool)

(declare-fun tp_is_empty!32833 () Bool)

(assert (=> b!1270256 (= e!724053 tp_is_empty!32833)))

(declare-fun b!1270257 () Bool)

(assert (=> b!1270257 (= e!724054 tp_is_empty!32833)))

(declare-fun mapIsEmpty!50830 () Bool)

(assert (=> mapIsEmpty!50830 mapRes!50830))

(declare-fun res!845326 () Bool)

(declare-fun e!724050 () Bool)

(assert (=> start!107144 (=> (not res!845326) (not e!724050))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107144 (= res!845326 (validMask!0 mask!1730))))

(assert (=> start!107144 e!724050))

(declare-fun array_inv!30555 (array!82839) Bool)

(assert (=> start!107144 (and (array_inv!30555 _values!1134) e!724051)))

(assert (=> start!107144 true))

(declare-datatypes ((array!82841 0))(
  ( (array!82842 (arr!39958 (Array (_ BitVec 32) (_ BitVec 64))) (size!40496 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82841)

(declare-fun array_inv!30556 (array!82841) Bool)

(assert (=> start!107144 (array_inv!30556 _keys!1364)))

(declare-fun b!1270258 () Bool)

(declare-fun res!845327 () Bool)

(assert (=> b!1270258 (=> (not res!845327) (not e!724050))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82841 (_ BitVec 32)) Bool)

(assert (=> b!1270258 (= res!845327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270259 () Bool)

(declare-fun res!845325 () Bool)

(assert (=> b!1270259 (=> (not res!845325) (not e!724050))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270259 (= res!845325 (and (= (size!40495 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40496 _keys!1364) (size!40495 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270260 () Bool)

(assert (=> b!1270260 (= e!724050 false)))

(declare-fun lt!574508 () Bool)

(declare-datatypes ((List!28557 0))(
  ( (Nil!28554) (Cons!28553 (h!29762 (_ BitVec 64)) (t!42078 List!28557)) )
))
(declare-fun arrayNoDuplicates!0 (array!82841 (_ BitVec 32) List!28557) Bool)

(assert (=> b!1270260 (= lt!574508 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28554))))

(declare-fun mapNonEmpty!50830 () Bool)

(declare-fun tp!97172 () Bool)

(assert (=> mapNonEmpty!50830 (= mapRes!50830 (and tp!97172 e!724053))))

(declare-fun mapRest!50830 () (Array (_ BitVec 32) ValueCell!15563))

(declare-fun mapKey!50830 () (_ BitVec 32))

(declare-fun mapValue!50830 () ValueCell!15563)

(assert (=> mapNonEmpty!50830 (= (arr!39957 _values!1134) (store mapRest!50830 mapKey!50830 mapValue!50830))))

(assert (= (and start!107144 res!845326) b!1270259))

(assert (= (and b!1270259 res!845325) b!1270258))

(assert (= (and b!1270258 res!845327) b!1270260))

(assert (= (and b!1270255 condMapEmpty!50830) mapIsEmpty!50830))

(assert (= (and b!1270255 (not condMapEmpty!50830)) mapNonEmpty!50830))

(get-info :version)

(assert (= (and mapNonEmpty!50830 ((_ is ValueCellFull!15563) mapValue!50830)) b!1270256))

(assert (= (and b!1270255 ((_ is ValueCellFull!15563) mapDefault!50830)) b!1270257))

(assert (= start!107144 b!1270255))

(declare-fun m!1168143 () Bool)

(assert (=> start!107144 m!1168143))

(declare-fun m!1168145 () Bool)

(assert (=> start!107144 m!1168145))

(declare-fun m!1168147 () Bool)

(assert (=> start!107144 m!1168147))

(declare-fun m!1168149 () Bool)

(assert (=> b!1270258 m!1168149))

(declare-fun m!1168151 () Bool)

(assert (=> b!1270260 m!1168151))

(declare-fun m!1168153 () Bool)

(assert (=> mapNonEmpty!50830 m!1168153))

(check-sat (not b!1270260) (not b!1270258) (not mapNonEmpty!50830) tp_is_empty!32833 (not start!107144))
(check-sat)
