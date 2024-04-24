; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107374 () Bool)

(assert start!107374)

(declare-fun b!1271678 () Bool)

(declare-fun e!724974 () Bool)

(declare-fun e!724971 () Bool)

(declare-fun mapRes!50839 () Bool)

(assert (=> b!1271678 (= e!724974 (and e!724971 mapRes!50839))))

(declare-fun condMapEmpty!50839 () Bool)

(declare-datatypes ((V!48979 0))(
  ( (V!48980 (val!16494 Int)) )
))
(declare-datatypes ((ValueCell!15566 0))(
  ( (ValueCellFull!15566 (v!19126 V!48979)) (EmptyCell!15566) )
))
(declare-datatypes ((array!82971 0))(
  ( (array!82972 (arr!40018 (Array (_ BitVec 32) ValueCell!15566)) (size!40555 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82971)

(declare-fun mapDefault!50839 () ValueCell!15566)

(assert (=> b!1271678 (= condMapEmpty!50839 (= (arr!40018 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15566)) mapDefault!50839)))))

(declare-fun b!1271679 () Bool)

(declare-fun tp_is_empty!32839 () Bool)

(assert (=> b!1271679 (= e!724971 tp_is_empty!32839)))

(declare-fun mapNonEmpty!50839 () Bool)

(declare-fun tp!97180 () Bool)

(declare-fun e!724972 () Bool)

(assert (=> mapNonEmpty!50839 (= mapRes!50839 (and tp!97180 e!724972))))

(declare-fun mapRest!50839 () (Array (_ BitVec 32) ValueCell!15566))

(declare-fun mapValue!50839 () ValueCell!15566)

(declare-fun mapKey!50839 () (_ BitVec 32))

(assert (=> mapNonEmpty!50839 (= (arr!40018 _values!1134) (store mapRest!50839 mapKey!50839 mapValue!50839))))

(declare-fun b!1271680 () Bool)

(declare-fun res!845900 () Bool)

(declare-fun e!724973 () Bool)

(assert (=> b!1271680 (=> (not res!845900) (not e!724973))))

(declare-datatypes ((array!82973 0))(
  ( (array!82974 (arr!40019 (Array (_ BitVec 32) (_ BitVec 64))) (size!40556 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82973)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82973 (_ BitVec 32)) Bool)

(assert (=> b!1271680 (= res!845900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271681 () Bool)

(declare-fun res!845901 () Bool)

(assert (=> b!1271681 (=> (not res!845901) (not e!724973))))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(assert (=> b!1271681 (= res!845901 (and (= (size!40555 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40556 _keys!1364) (size!40555 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun res!845899 () Bool)

(assert (=> start!107374 (=> (not res!845899) (not e!724973))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107374 (= res!845899 (validMask!0 mask!1730))))

(assert (=> start!107374 e!724973))

(declare-fun array_inv!30615 (array!82971) Bool)

(assert (=> start!107374 (and (array_inv!30615 _values!1134) e!724974)))

(assert (=> start!107374 true))

(declare-fun array_inv!30616 (array!82973) Bool)

(assert (=> start!107374 (array_inv!30616 _keys!1364)))

(declare-fun mapIsEmpty!50839 () Bool)

(assert (=> mapIsEmpty!50839 mapRes!50839))

(declare-fun b!1271682 () Bool)

(assert (=> b!1271682 (= e!724972 tp_is_empty!32839)))

(declare-fun b!1271683 () Bool)

(assert (=> b!1271683 (= e!724973 false)))

(declare-fun lt!575179 () Bool)

(declare-datatypes ((List!28517 0))(
  ( (Nil!28514) (Cons!28513 (h!29731 (_ BitVec 64)) (t!42038 List!28517)) )
))
(declare-fun arrayNoDuplicates!0 (array!82973 (_ BitVec 32) List!28517) Bool)

(assert (=> b!1271683 (= lt!575179 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28514))))

(assert (= (and start!107374 res!845899) b!1271681))

(assert (= (and b!1271681 res!845901) b!1271680))

(assert (= (and b!1271680 res!845900) b!1271683))

(assert (= (and b!1271678 condMapEmpty!50839) mapIsEmpty!50839))

(assert (= (and b!1271678 (not condMapEmpty!50839)) mapNonEmpty!50839))

(get-info :version)

(assert (= (and mapNonEmpty!50839 ((_ is ValueCellFull!15566) mapValue!50839)) b!1271682))

(assert (= (and b!1271678 ((_ is ValueCellFull!15566) mapDefault!50839)) b!1271679))

(assert (= start!107374 b!1271678))

(declare-fun m!1170291 () Bool)

(assert (=> mapNonEmpty!50839 m!1170291))

(declare-fun m!1170293 () Bool)

(assert (=> b!1271680 m!1170293))

(declare-fun m!1170295 () Bool)

(assert (=> start!107374 m!1170295))

(declare-fun m!1170297 () Bool)

(assert (=> start!107374 m!1170297))

(declare-fun m!1170299 () Bool)

(assert (=> start!107374 m!1170299))

(declare-fun m!1170301 () Bool)

(assert (=> b!1271683 m!1170301))

(check-sat (not b!1271680) (not b!1271683) tp_is_empty!32839 (not start!107374) (not mapNonEmpty!50839))
(check-sat)
