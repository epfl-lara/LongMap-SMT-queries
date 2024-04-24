; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20182 () Bool)

(assert start!20182)

(declare-fun b_free!4837 () Bool)

(declare-fun b_next!4837 () Bool)

(assert (=> start!20182 (= b_free!4837 (not b_next!4837))))

(declare-fun tp!17543 () Bool)

(declare-fun b_and!11597 () Bool)

(assert (=> start!20182 (= tp!17543 b_and!11597)))

(declare-fun b!198151 () Bool)

(declare-fun e!130280 () Bool)

(declare-fun tp_is_empty!4693 () Bool)

(assert (=> b!198151 (= e!130280 tp_is_empty!4693)))

(declare-fun b!198152 () Bool)

(declare-fun res!93877 () Bool)

(declare-fun e!130283 () Bool)

(assert (=> b!198152 (=> (not res!93877) (not e!130283))))

(declare-datatypes ((array!8625 0))(
  ( (array!8626 (arr!4063 (Array (_ BitVec 32) (_ BitVec 64))) (size!4388 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8625)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!198152 (= res!93877 (= (select (arr!4063 _keys!825) i!601) k0!843))))

(declare-fun b!198153 () Bool)

(declare-fun res!93879 () Bool)

(assert (=> b!198153 (=> (not res!93879) (not e!130283))))

(declare-datatypes ((List!2492 0))(
  ( (Nil!2489) (Cons!2488 (h!3130 (_ BitVec 64)) (t!7415 List!2492)) )
))
(declare-fun arrayNoDuplicates!0 (array!8625 (_ BitVec 32) List!2492) Bool)

(assert (=> b!198153 (= res!93879 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2489))))

(declare-fun b!198154 () Bool)

(declare-fun res!93875 () Bool)

(assert (=> b!198154 (=> (not res!93875) (not e!130283))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198154 (= res!93875 (validKeyInArray!0 k0!843))))

(declare-fun mapIsEmpty!8108 () Bool)

(declare-fun mapRes!8108 () Bool)

(assert (=> mapIsEmpty!8108 mapRes!8108))

(declare-fun b!198155 () Bool)

(declare-fun e!130281 () Bool)

(assert (=> b!198155 (= e!130281 tp_is_empty!4693)))

(declare-fun res!93874 () Bool)

(assert (=> start!20182 (=> (not res!93874) (not e!130283))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20182 (= res!93874 (validMask!0 mask!1149))))

(assert (=> start!20182 e!130283))

(declare-datatypes ((V!5905 0))(
  ( (V!5906 (val!2391 Int)) )
))
(declare-datatypes ((ValueCell!2003 0))(
  ( (ValueCellFull!2003 (v!4362 V!5905)) (EmptyCell!2003) )
))
(declare-datatypes ((array!8627 0))(
  ( (array!8628 (arr!4064 (Array (_ BitVec 32) ValueCell!2003)) (size!4389 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8627)

(declare-fun e!130279 () Bool)

(declare-fun array_inv!2649 (array!8627) Bool)

(assert (=> start!20182 (and (array_inv!2649 _values!649) e!130279)))

(assert (=> start!20182 true))

(assert (=> start!20182 tp_is_empty!4693))

(declare-fun array_inv!2650 (array!8625) Bool)

(assert (=> start!20182 (array_inv!2650 _keys!825)))

(assert (=> start!20182 tp!17543))

(declare-fun b!198156 () Bool)

(declare-fun res!93880 () Bool)

(assert (=> b!198156 (=> (not res!93880) (not e!130283))))

(assert (=> b!198156 (= res!93880 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4388 _keys!825))))))

(declare-fun mapNonEmpty!8108 () Bool)

(declare-fun tp!17542 () Bool)

(assert (=> mapNonEmpty!8108 (= mapRes!8108 (and tp!17542 e!130280))))

(declare-fun mapKey!8108 () (_ BitVec 32))

(declare-fun mapRest!8108 () (Array (_ BitVec 32) ValueCell!2003))

(declare-fun mapValue!8108 () ValueCell!2003)

(assert (=> mapNonEmpty!8108 (= (arr!4064 _values!649) (store mapRest!8108 mapKey!8108 mapValue!8108))))

(declare-fun b!198157 () Bool)

(assert (=> b!198157 (= e!130279 (and e!130281 mapRes!8108))))

(declare-fun condMapEmpty!8108 () Bool)

(declare-fun mapDefault!8108 () ValueCell!2003)

(assert (=> b!198157 (= condMapEmpty!8108 (= (arr!4064 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2003)) mapDefault!8108)))))

(declare-fun b!198158 () Bool)

(declare-fun res!93876 () Bool)

(assert (=> b!198158 (=> (not res!93876) (not e!130283))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!198158 (= res!93876 (and (= (size!4389 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4388 _keys!825) (size!4389 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!198159 () Bool)

(declare-fun res!93878 () Bool)

(assert (=> b!198159 (=> (not res!93878) (not e!130283))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8625 (_ BitVec 32)) Bool)

(assert (=> b!198159 (= res!93878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!198160 () Bool)

(assert (=> b!198160 (= e!130283 false)))

(declare-datatypes ((tuple2!3574 0))(
  ( (tuple2!3575 (_1!1798 (_ BitVec 64)) (_2!1798 V!5905)) )
))
(declare-datatypes ((List!2493 0))(
  ( (Nil!2490) (Cons!2489 (h!3131 tuple2!3574) (t!7416 List!2493)) )
))
(declare-datatypes ((ListLongMap!2489 0))(
  ( (ListLongMap!2490 (toList!1260 List!2493)) )
))
(declare-fun lt!97909 () ListLongMap!2489)

(declare-fun v!520 () V!5905)

(declare-fun zeroValue!615 () V!5905)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5905)

(declare-fun getCurrentListMapNoExtraKeys!250 (array!8625 array!8627 (_ BitVec 32) (_ BitVec 32) V!5905 V!5905 (_ BitVec 32) Int) ListLongMap!2489)

(assert (=> b!198160 (= lt!97909 (getCurrentListMapNoExtraKeys!250 _keys!825 (array!8628 (store (arr!4064 _values!649) i!601 (ValueCellFull!2003 v!520)) (size!4389 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97910 () ListLongMap!2489)

(assert (=> b!198160 (= lt!97910 (getCurrentListMapNoExtraKeys!250 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and start!20182 res!93874) b!198158))

(assert (= (and b!198158 res!93876) b!198159))

(assert (= (and b!198159 res!93878) b!198153))

(assert (= (and b!198153 res!93879) b!198156))

(assert (= (and b!198156 res!93880) b!198154))

(assert (= (and b!198154 res!93875) b!198152))

(assert (= (and b!198152 res!93877) b!198160))

(assert (= (and b!198157 condMapEmpty!8108) mapIsEmpty!8108))

(assert (= (and b!198157 (not condMapEmpty!8108)) mapNonEmpty!8108))

(get-info :version)

(assert (= (and mapNonEmpty!8108 ((_ is ValueCellFull!2003) mapValue!8108)) b!198151))

(assert (= (and b!198157 ((_ is ValueCellFull!2003) mapDefault!8108)) b!198155))

(assert (= start!20182 b!198157))

(declare-fun m!224985 () Bool)

(assert (=> b!198160 m!224985))

(declare-fun m!224987 () Bool)

(assert (=> b!198160 m!224987))

(declare-fun m!224989 () Bool)

(assert (=> b!198160 m!224989))

(declare-fun m!224991 () Bool)

(assert (=> mapNonEmpty!8108 m!224991))

(declare-fun m!224993 () Bool)

(assert (=> b!198152 m!224993))

(declare-fun m!224995 () Bool)

(assert (=> b!198153 m!224995))

(declare-fun m!224997 () Bool)

(assert (=> b!198159 m!224997))

(declare-fun m!224999 () Bool)

(assert (=> start!20182 m!224999))

(declare-fun m!225001 () Bool)

(assert (=> start!20182 m!225001))

(declare-fun m!225003 () Bool)

(assert (=> start!20182 m!225003))

(declare-fun m!225005 () Bool)

(assert (=> b!198154 m!225005))

(check-sat (not b!198154) (not b!198153) tp_is_empty!4693 (not mapNonEmpty!8108) (not b_next!4837) b_and!11597 (not b!198159) (not b!198160) (not start!20182))
(check-sat b_and!11597 (not b_next!4837))
