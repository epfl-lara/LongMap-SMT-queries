; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20098 () Bool)

(assert start!20098)

(declare-fun b_free!4753 () Bool)

(declare-fun b_next!4753 () Bool)

(assert (=> start!20098 (= b_free!4753 (not b_next!4753))))

(declare-fun tp!17290 () Bool)

(declare-fun b_and!11513 () Bool)

(assert (=> start!20098 (= tp!17290 b_and!11513)))

(declare-fun b!196891 () Bool)

(declare-fun res!92995 () Bool)

(declare-fun e!129650 () Bool)

(assert (=> b!196891 (=> (not res!92995) (not e!129650))))

(declare-datatypes ((array!8463 0))(
  ( (array!8464 (arr!3982 (Array (_ BitVec 32) (_ BitVec 64))) (size!4307 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8463)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!196891 (= res!92995 (= (select (arr!3982 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!7982 () Bool)

(declare-fun mapRes!7982 () Bool)

(assert (=> mapIsEmpty!7982 mapRes!7982))

(declare-fun b!196892 () Bool)

(declare-fun e!129651 () Bool)

(declare-fun e!129652 () Bool)

(assert (=> b!196892 (= e!129651 (and e!129652 mapRes!7982))))

(declare-fun condMapEmpty!7982 () Bool)

(declare-datatypes ((V!5793 0))(
  ( (V!5794 (val!2349 Int)) )
))
(declare-datatypes ((ValueCell!1961 0))(
  ( (ValueCellFull!1961 (v!4320 V!5793)) (EmptyCell!1961) )
))
(declare-datatypes ((array!8465 0))(
  ( (array!8466 (arr!3983 (Array (_ BitVec 32) ValueCell!1961)) (size!4308 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8465)

(declare-fun mapDefault!7982 () ValueCell!1961)

(assert (=> b!196892 (= condMapEmpty!7982 (= (arr!3983 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1961)) mapDefault!7982)))))

(declare-fun mapNonEmpty!7982 () Bool)

(declare-fun tp!17291 () Bool)

(declare-fun e!129653 () Bool)

(assert (=> mapNonEmpty!7982 (= mapRes!7982 (and tp!17291 e!129653))))

(declare-fun mapRest!7982 () (Array (_ BitVec 32) ValueCell!1961))

(declare-fun mapKey!7982 () (_ BitVec 32))

(declare-fun mapValue!7982 () ValueCell!1961)

(assert (=> mapNonEmpty!7982 (= (arr!3983 _values!649) (store mapRest!7982 mapKey!7982 mapValue!7982))))

(declare-fun res!92994 () Bool)

(assert (=> start!20098 (=> (not res!92994) (not e!129650))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20098 (= res!92994 (validMask!0 mask!1149))))

(assert (=> start!20098 e!129650))

(declare-fun array_inv!2587 (array!8465) Bool)

(assert (=> start!20098 (and (array_inv!2587 _values!649) e!129651)))

(assert (=> start!20098 true))

(declare-fun tp_is_empty!4609 () Bool)

(assert (=> start!20098 tp_is_empty!4609))

(declare-fun array_inv!2588 (array!8463) Bool)

(assert (=> start!20098 (array_inv!2588 _keys!825)))

(assert (=> start!20098 tp!17290))

(declare-fun b!196893 () Bool)

(declare-fun res!92996 () Bool)

(assert (=> b!196893 (=> (not res!92996) (not e!129650))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8463 (_ BitVec 32)) Bool)

(assert (=> b!196893 (= res!92996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!196894 () Bool)

(declare-fun res!92992 () Bool)

(assert (=> b!196894 (=> (not res!92992) (not e!129650))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!196894 (= res!92992 (validKeyInArray!0 k0!843))))

(declare-fun b!196895 () Bool)

(declare-fun res!92993 () Bool)

(assert (=> b!196895 (=> (not res!92993) (not e!129650))))

(assert (=> b!196895 (= res!92993 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4307 _keys!825))))))

(declare-fun b!196896 () Bool)

(assert (=> b!196896 (= e!129652 tp_is_empty!4609)))

(declare-fun b!196897 () Bool)

(declare-fun res!92998 () Bool)

(assert (=> b!196897 (=> (not res!92998) (not e!129650))))

(declare-datatypes ((List!2441 0))(
  ( (Nil!2438) (Cons!2437 (h!3079 (_ BitVec 64)) (t!7364 List!2441)) )
))
(declare-fun arrayNoDuplicates!0 (array!8463 (_ BitVec 32) List!2441) Bool)

(assert (=> b!196897 (= res!92998 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2438))))

(declare-fun b!196898 () Bool)

(assert (=> b!196898 (= e!129653 tp_is_empty!4609)))

(declare-fun b!196899 () Bool)

(assert (=> b!196899 (= e!129650 false)))

(declare-datatypes ((tuple2!3522 0))(
  ( (tuple2!3523 (_1!1772 (_ BitVec 64)) (_2!1772 V!5793)) )
))
(declare-datatypes ((List!2442 0))(
  ( (Nil!2439) (Cons!2438 (h!3080 tuple2!3522) (t!7365 List!2442)) )
))
(declare-datatypes ((ListLongMap!2437 0))(
  ( (ListLongMap!2438 (toList!1234 List!2442)) )
))
(declare-fun lt!97718 () ListLongMap!2437)

(declare-fun zeroValue!615 () V!5793)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5793)

(declare-fun getCurrentListMapNoExtraKeys!224 (array!8463 array!8465 (_ BitVec 32) (_ BitVec 32) V!5793 V!5793 (_ BitVec 32) Int) ListLongMap!2437)

(assert (=> b!196899 (= lt!97718 (getCurrentListMapNoExtraKeys!224 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!196900 () Bool)

(declare-fun res!92997 () Bool)

(assert (=> b!196900 (=> (not res!92997) (not e!129650))))

(assert (=> b!196900 (= res!92997 (and (= (size!4308 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4307 _keys!825) (size!4308 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(assert (= (and start!20098 res!92994) b!196900))

(assert (= (and b!196900 res!92997) b!196893))

(assert (= (and b!196893 res!92996) b!196897))

(assert (= (and b!196897 res!92998) b!196895))

(assert (= (and b!196895 res!92993) b!196894))

(assert (= (and b!196894 res!92992) b!196891))

(assert (= (and b!196891 res!92995) b!196899))

(assert (= (and b!196892 condMapEmpty!7982) mapIsEmpty!7982))

(assert (= (and b!196892 (not condMapEmpty!7982)) mapNonEmpty!7982))

(get-info :version)

(assert (= (and mapNonEmpty!7982 ((_ is ValueCellFull!1961) mapValue!7982)) b!196898))

(assert (= (and b!196892 ((_ is ValueCellFull!1961) mapDefault!7982)) b!196896))

(assert (= start!20098 b!196892))

(declare-fun m!224145 () Bool)

(assert (=> start!20098 m!224145))

(declare-fun m!224147 () Bool)

(assert (=> start!20098 m!224147))

(declare-fun m!224149 () Bool)

(assert (=> start!20098 m!224149))

(declare-fun m!224151 () Bool)

(assert (=> b!196894 m!224151))

(declare-fun m!224153 () Bool)

(assert (=> b!196891 m!224153))

(declare-fun m!224155 () Bool)

(assert (=> b!196893 m!224155))

(declare-fun m!224157 () Bool)

(assert (=> b!196897 m!224157))

(declare-fun m!224159 () Bool)

(assert (=> b!196899 m!224159))

(declare-fun m!224161 () Bool)

(assert (=> mapNonEmpty!7982 m!224161))

(check-sat (not b_next!4753) tp_is_empty!4609 (not mapNonEmpty!7982) (not b!196899) b_and!11513 (not start!20098) (not b!196893) (not b!196894) (not b!196897))
(check-sat b_and!11513 (not b_next!4753))
