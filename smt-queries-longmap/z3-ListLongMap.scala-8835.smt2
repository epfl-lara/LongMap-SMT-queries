; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107236 () Bool)

(assert start!107236)

(declare-fun b!1271147 () Bool)

(declare-fun e!724772 () Bool)

(assert (=> b!1271147 (= e!724772 false)))

(declare-fun lt!574824 () Bool)

(declare-datatypes ((array!83106 0))(
  ( (array!83107 (arr!40090 (Array (_ BitVec 32) (_ BitVec 64))) (size!40626 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83106)

(declare-datatypes ((List!28513 0))(
  ( (Nil!28510) (Cons!28509 (h!29718 (_ BitVec 64)) (t!42042 List!28513)) )
))
(declare-fun arrayNoDuplicates!0 (array!83106 (_ BitVec 32) List!28513) Bool)

(assert (=> b!1271147 (= lt!574824 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28510))))

(declare-fun mapNonEmpty!50968 () Bool)

(declare-fun mapRes!50968 () Bool)

(declare-fun tp!97309 () Bool)

(declare-fun e!724773 () Bool)

(assert (=> mapNonEmpty!50968 (= mapRes!50968 (and tp!97309 e!724773))))

(declare-datatypes ((V!49093 0))(
  ( (V!49094 (val!16537 Int)) )
))
(declare-datatypes ((ValueCell!15609 0))(
  ( (ValueCellFull!15609 (v!19174 V!49093)) (EmptyCell!15609) )
))
(declare-datatypes ((array!83108 0))(
  ( (array!83109 (arr!40091 (Array (_ BitVec 32) ValueCell!15609)) (size!40627 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83108)

(declare-fun mapKey!50968 () (_ BitVec 32))

(declare-fun mapValue!50968 () ValueCell!15609)

(declare-fun mapRest!50968 () (Array (_ BitVec 32) ValueCell!15609))

(assert (=> mapNonEmpty!50968 (= (arr!40091 _values!1134) (store mapRest!50968 mapKey!50968 mapValue!50968))))

(declare-fun res!845767 () Bool)

(assert (=> start!107236 (=> (not res!845767) (not e!724772))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107236 (= res!845767 (validMask!0 mask!1730))))

(assert (=> start!107236 e!724772))

(declare-fun e!724771 () Bool)

(declare-fun array_inv!30493 (array!83108) Bool)

(assert (=> start!107236 (and (array_inv!30493 _values!1134) e!724771)))

(assert (=> start!107236 true))

(declare-fun array_inv!30494 (array!83106) Bool)

(assert (=> start!107236 (array_inv!30494 _keys!1364)))

(declare-fun b!1271148 () Bool)

(declare-fun e!724769 () Bool)

(declare-fun tp_is_empty!32925 () Bool)

(assert (=> b!1271148 (= e!724769 tp_is_empty!32925)))

(declare-fun mapIsEmpty!50968 () Bool)

(assert (=> mapIsEmpty!50968 mapRes!50968))

(declare-fun b!1271149 () Bool)

(declare-fun res!845768 () Bool)

(assert (=> b!1271149 (=> (not res!845768) (not e!724772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83106 (_ BitVec 32)) Bool)

(assert (=> b!1271149 (= res!845768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271150 () Bool)

(assert (=> b!1271150 (= e!724773 tp_is_empty!32925)))

(declare-fun b!1271151 () Bool)

(declare-fun res!845766 () Bool)

(assert (=> b!1271151 (=> (not res!845766) (not e!724772))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271151 (= res!845766 (and (= (size!40627 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40626 _keys!1364) (size!40627 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271152 () Bool)

(assert (=> b!1271152 (= e!724771 (and e!724769 mapRes!50968))))

(declare-fun condMapEmpty!50968 () Bool)

(declare-fun mapDefault!50968 () ValueCell!15609)

(assert (=> b!1271152 (= condMapEmpty!50968 (= (arr!40091 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15609)) mapDefault!50968)))))

(assert (= (and start!107236 res!845767) b!1271151))

(assert (= (and b!1271151 res!845766) b!1271149))

(assert (= (and b!1271149 res!845768) b!1271147))

(assert (= (and b!1271152 condMapEmpty!50968) mapIsEmpty!50968))

(assert (= (and b!1271152 (not condMapEmpty!50968)) mapNonEmpty!50968))

(get-info :version)

(assert (= (and mapNonEmpty!50968 ((_ is ValueCellFull!15609) mapValue!50968)) b!1271150))

(assert (= (and b!1271152 ((_ is ValueCellFull!15609) mapDefault!50968)) b!1271148))

(assert (= start!107236 b!1271152))

(declare-fun m!1169195 () Bool)

(assert (=> b!1271147 m!1169195))

(declare-fun m!1169197 () Bool)

(assert (=> mapNonEmpty!50968 m!1169197))

(declare-fun m!1169199 () Bool)

(assert (=> start!107236 m!1169199))

(declare-fun m!1169201 () Bool)

(assert (=> start!107236 m!1169201))

(declare-fun m!1169203 () Bool)

(assert (=> start!107236 m!1169203))

(declare-fun m!1169205 () Bool)

(assert (=> b!1271149 m!1169205))

(check-sat (not b!1271149) tp_is_empty!32925 (not start!107236) (not b!1271147) (not mapNonEmpty!50968))
(check-sat)
