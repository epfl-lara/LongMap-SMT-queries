; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77588 () Bool)

(assert start!77588)

(declare-fun b_free!16173 () Bool)

(declare-fun b_next!16173 () Bool)

(assert (=> start!77588 (= b_free!16173 (not b_next!16173))))

(declare-fun tp!56780 () Bool)

(declare-fun b_and!26539 () Bool)

(assert (=> start!77588 (= tp!56780 b_and!26539)))

(declare-fun mapIsEmpty!29599 () Bool)

(declare-fun mapRes!29599 () Bool)

(assert (=> mapIsEmpty!29599 mapRes!29599))

(declare-fun b!904155 () Bool)

(declare-fun res!610043 () Bool)

(declare-fun e!506633 () Bool)

(assert (=> b!904155 (=> (not res!610043) (not e!506633))))

(declare-datatypes ((V!29753 0))(
  ( (V!29754 (val!9346 Int)) )
))
(declare-datatypes ((ValueCell!8814 0))(
  ( (ValueCellFull!8814 (v!11851 V!29753)) (EmptyCell!8814) )
))
(declare-datatypes ((array!53232 0))(
  ( (array!53233 (arr!25575 (Array (_ BitVec 32) ValueCell!8814)) (size!26034 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53232)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53234 0))(
  ( (array!53235 (arr!25576 (Array (_ BitVec 32) (_ BitVec 64))) (size!26035 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53234)

(assert (=> b!904155 (= res!610043 (and (= (size!26034 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26035 _keys!1386) (size!26034 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!904156 () Bool)

(declare-fun res!610039 () Bool)

(assert (=> b!904156 (=> (not res!610039) (not e!506633))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!904156 (= res!610039 (inRange!0 i!717 mask!1756))))

(declare-fun b!904157 () Bool)

(declare-fun e!506632 () Bool)

(declare-fun tp_is_empty!18591 () Bool)

(assert (=> b!904157 (= e!506632 tp_is_empty!18591)))

(declare-fun b!904158 () Bool)

(declare-fun res!610044 () Bool)

(assert (=> b!904158 (=> (not res!610044) (not e!506633))))

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!904158 (= res!610044 (and (= (select (arr!25576 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!904160 () Bool)

(declare-fun res!610038 () Bool)

(assert (=> b!904160 (=> (not res!610038) (not e!506633))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29753)

(declare-fun minValue!1094 () V!29753)

(declare-datatypes ((tuple2!12142 0))(
  ( (tuple2!12143 (_1!6082 (_ BitVec 64)) (_2!6082 V!29753)) )
))
(declare-datatypes ((List!17960 0))(
  ( (Nil!17957) (Cons!17956 (h!19102 tuple2!12142) (t!25343 List!17960)) )
))
(declare-datatypes ((ListLongMap!10839 0))(
  ( (ListLongMap!10840 (toList!5435 List!17960)) )
))
(declare-fun contains!4483 (ListLongMap!10839 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2704 (array!53234 array!53232 (_ BitVec 32) (_ BitVec 32) V!29753 V!29753 (_ BitVec 32) Int) ListLongMap!10839)

(assert (=> b!904160 (= res!610038 (contains!4483 (getCurrentListMap!2704 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!904161 () Bool)

(declare-fun e!506628 () Bool)

(declare-fun e!506630 () Bool)

(assert (=> b!904161 (= e!506628 e!506630)))

(declare-fun res!610042 () Bool)

(assert (=> b!904161 (=> res!610042 e!506630)))

(declare-fun lt!408164 () ListLongMap!10839)

(assert (=> b!904161 (= res!610042 (not (contains!4483 lt!408164 k0!1033)))))

(assert (=> b!904161 (= lt!408164 (getCurrentListMap!2704 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!904162 () Bool)

(declare-fun res!610040 () Bool)

(assert (=> b!904162 (=> (not res!610040) (not e!506633))))

(declare-datatypes ((List!17961 0))(
  ( (Nil!17958) (Cons!17957 (h!19103 (_ BitVec 64)) (t!25344 List!17961)) )
))
(declare-fun arrayNoDuplicates!0 (array!53234 (_ BitVec 32) List!17961) Bool)

(assert (=> b!904162 (= res!610040 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17958))))

(declare-fun mapNonEmpty!29599 () Bool)

(declare-fun tp!56781 () Bool)

(assert (=> mapNonEmpty!29599 (= mapRes!29599 (and tp!56781 e!506632))))

(declare-fun mapRest!29599 () (Array (_ BitVec 32) ValueCell!8814))

(declare-fun mapKey!29599 () (_ BitVec 32))

(declare-fun mapValue!29599 () ValueCell!8814)

(assert (=> mapNonEmpty!29599 (= (arr!25575 _values!1152) (store mapRest!29599 mapKey!29599 mapValue!29599))))

(declare-fun b!904163 () Bool)

(assert (=> b!904163 (= e!506630 true)))

(declare-fun lt!408163 () V!29753)

(declare-fun apply!432 (ListLongMap!10839 (_ BitVec 64)) V!29753)

(assert (=> b!904163 (= lt!408163 (apply!432 lt!408164 k0!1033))))

(declare-fun b!904164 () Bool)

(declare-fun e!506629 () Bool)

(declare-fun e!506631 () Bool)

(assert (=> b!904164 (= e!506629 (and e!506631 mapRes!29599))))

(declare-fun condMapEmpty!29599 () Bool)

(declare-fun mapDefault!29599 () ValueCell!8814)

(assert (=> b!904164 (= condMapEmpty!29599 (= (arr!25575 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8814)) mapDefault!29599)))))

(declare-fun b!904159 () Bool)

(declare-fun res!610041 () Bool)

(assert (=> b!904159 (=> (not res!610041) (not e!506633))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53234 (_ BitVec 32)) Bool)

(assert (=> b!904159 (= res!610041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun res!610045 () Bool)

(assert (=> start!77588 (=> (not res!610045) (not e!506633))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77588 (= res!610045 (validMask!0 mask!1756))))

(assert (=> start!77588 e!506633))

(declare-fun array_inv!20040 (array!53232) Bool)

(assert (=> start!77588 (and (array_inv!20040 _values!1152) e!506629)))

(assert (=> start!77588 tp!56780))

(assert (=> start!77588 true))

(assert (=> start!77588 tp_is_empty!18591))

(declare-fun array_inv!20041 (array!53234) Bool)

(assert (=> start!77588 (array_inv!20041 _keys!1386)))

(declare-fun b!904165 () Bool)

(assert (=> b!904165 (= e!506633 (not e!506628))))

(declare-fun res!610046 () Bool)

(assert (=> b!904165 (=> res!610046 e!506628)))

(assert (=> b!904165 (= res!610046 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26035 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!53234 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!904165 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30666 0))(
  ( (Unit!30667) )
))
(declare-fun lt!408165 () Unit!30666)

(declare-fun lemmaKeyInListMapIsInArray!176 (array!53234 array!53232 (_ BitVec 32) (_ BitVec 32) V!29753 V!29753 (_ BitVec 64) Int) Unit!30666)

(assert (=> b!904165 (= lt!408165 (lemmaKeyInListMapIsInArray!176 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!904166 () Bool)

(assert (=> b!904166 (= e!506631 tp_is_empty!18591)))

(assert (= (and start!77588 res!610045) b!904155))

(assert (= (and b!904155 res!610043) b!904159))

(assert (= (and b!904159 res!610041) b!904162))

(assert (= (and b!904162 res!610040) b!904160))

(assert (= (and b!904160 res!610038) b!904156))

(assert (= (and b!904156 res!610039) b!904158))

(assert (= (and b!904158 res!610044) b!904165))

(assert (= (and b!904165 (not res!610046)) b!904161))

(assert (= (and b!904161 (not res!610042)) b!904163))

(assert (= (and b!904164 condMapEmpty!29599) mapIsEmpty!29599))

(assert (= (and b!904164 (not condMapEmpty!29599)) mapNonEmpty!29599))

(get-info :version)

(assert (= (and mapNonEmpty!29599 ((_ is ValueCellFull!8814) mapValue!29599)) b!904157))

(assert (= (and b!904164 ((_ is ValueCellFull!8814) mapDefault!29599)) b!904166))

(assert (= start!77588 b!904164))

(declare-fun m!839695 () Bool)

(assert (=> b!904163 m!839695))

(declare-fun m!839697 () Bool)

(assert (=> b!904159 m!839697))

(declare-fun m!839699 () Bool)

(assert (=> mapNonEmpty!29599 m!839699))

(declare-fun m!839701 () Bool)

(assert (=> b!904161 m!839701))

(declare-fun m!839703 () Bool)

(assert (=> b!904161 m!839703))

(declare-fun m!839705 () Bool)

(assert (=> b!904156 m!839705))

(declare-fun m!839707 () Bool)

(assert (=> b!904165 m!839707))

(declare-fun m!839709 () Bool)

(assert (=> b!904165 m!839709))

(declare-fun m!839711 () Bool)

(assert (=> b!904162 m!839711))

(declare-fun m!839713 () Bool)

(assert (=> b!904160 m!839713))

(assert (=> b!904160 m!839713))

(declare-fun m!839715 () Bool)

(assert (=> b!904160 m!839715))

(declare-fun m!839717 () Bool)

(assert (=> b!904158 m!839717))

(declare-fun m!839719 () Bool)

(assert (=> start!77588 m!839719))

(declare-fun m!839721 () Bool)

(assert (=> start!77588 m!839721))

(declare-fun m!839723 () Bool)

(assert (=> start!77588 m!839723))

(check-sat (not b!904160) (not start!77588) tp_is_empty!18591 (not b!904165) (not b!904159) (not b!904156) (not b!904161) (not b!904163) (not mapNonEmpty!29599) b_and!26539 (not b_next!16173) (not b!904162))
(check-sat b_and!26539 (not b_next!16173))
