; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83478 () Bool)

(assert start!83478)

(declare-fun b_free!19483 () Bool)

(declare-fun b_next!19483 () Bool)

(assert (=> start!83478 (= b_free!19483 (not b_next!19483))))

(declare-fun tp!67738 () Bool)

(declare-fun b_and!31059 () Bool)

(assert (=> start!83478 (= tp!67738 b_and!31059)))

(declare-fun b!975158 () Bool)

(declare-fun e!549581 () Bool)

(assert (=> b!975158 (= e!549581 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34833 0))(
  ( (V!34834 (val!11244 Int)) )
))
(declare-datatypes ((ValueCell!10712 0))(
  ( (ValueCellFull!10712 (v!13802 V!34833)) (EmptyCell!10712) )
))
(declare-datatypes ((array!60734 0))(
  ( (array!60735 (arr!29231 (Array (_ BitVec 32) ValueCell!10712)) (size!29712 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60734)

(declare-fun zeroValue!1367 () V!34833)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-datatypes ((tuple2!14522 0))(
  ( (tuple2!14523 (_1!7272 (_ BitVec 64)) (_2!7272 V!34833)) )
))
(declare-datatypes ((List!20329 0))(
  ( (Nil!20326) (Cons!20325 (h!21487 tuple2!14522) (t!28797 List!20329)) )
))
(declare-datatypes ((ListLongMap!13209 0))(
  ( (ListLongMap!13210 (toList!6620 List!20329)) )
))
(declare-fun lt!432624 () ListLongMap!13209)

(declare-fun minValue!1367 () V!34833)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60736 0))(
  ( (array!60737 (arr!29232 (Array (_ BitVec 32) (_ BitVec 64))) (size!29713 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60736)

(declare-fun getCurrentListMap!3782 (array!60736 array!60734 (_ BitVec 32) (_ BitVec 32) V!34833 V!34833 (_ BitVec 32) Int) ListLongMap!13209)

(assert (=> b!975158 (= lt!432624 (getCurrentListMap!3782 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapNonEmpty!35590 () Bool)

(declare-fun mapRes!35590 () Bool)

(declare-fun tp!67737 () Bool)

(declare-fun e!549582 () Bool)

(assert (=> mapNonEmpty!35590 (= mapRes!35590 (and tp!67737 e!549582))))

(declare-fun mapRest!35590 () (Array (_ BitVec 32) ValueCell!10712))

(declare-fun mapValue!35590 () ValueCell!10712)

(declare-fun mapKey!35590 () (_ BitVec 32))

(assert (=> mapNonEmpty!35590 (= (arr!29231 _values!1425) (store mapRest!35590 mapKey!35590 mapValue!35590))))

(declare-fun res!652840 () Bool)

(assert (=> start!83478 (=> (not res!652840) (not e!549581))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83478 (= res!652840 (validMask!0 mask!2147))))

(assert (=> start!83478 e!549581))

(assert (=> start!83478 true))

(declare-fun e!549578 () Bool)

(declare-fun array_inv!22653 (array!60734) Bool)

(assert (=> start!83478 (and (array_inv!22653 _values!1425) e!549578)))

(declare-fun tp_is_empty!22387 () Bool)

(assert (=> start!83478 tp_is_empty!22387))

(assert (=> start!83478 tp!67738))

(declare-fun array_inv!22654 (array!60736) Bool)

(assert (=> start!83478 (array_inv!22654 _keys!1717)))

(declare-fun b!975159 () Bool)

(declare-fun res!652844 () Bool)

(assert (=> b!975159 (=> (not res!652844) (not e!549581))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60736 (_ BitVec 32)) Bool)

(assert (=> b!975159 (= res!652844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!975160 () Bool)

(declare-fun res!652846 () Bool)

(assert (=> b!975160 (=> (not res!652846) (not e!549581))))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!975160 (= res!652846 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29713 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29713 _keys!1717))))))

(declare-fun b!975161 () Bool)

(declare-fun e!549580 () Bool)

(assert (=> b!975161 (= e!549580 tp_is_empty!22387)))

(declare-fun b!975162 () Bool)

(declare-fun res!652845 () Bool)

(assert (=> b!975162 (=> (not res!652845) (not e!549581))))

(assert (=> b!975162 (= res!652845 (and (= (size!29712 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29713 _keys!1717) (size!29712 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!975163 () Bool)

(declare-fun res!652841 () Bool)

(assert (=> b!975163 (=> (not res!652841) (not e!549581))))

(declare-fun contains!5651 (ListLongMap!13209 (_ BitVec 64)) Bool)

(assert (=> b!975163 (= res!652841 (contains!5651 (getCurrentListMap!3782 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29232 _keys!1717) i!822)))))

(declare-fun b!975164 () Bool)

(declare-fun res!652842 () Bool)

(assert (=> b!975164 (=> (not res!652842) (not e!549581))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975164 (= res!652842 (validKeyInArray!0 (select (arr!29232 _keys!1717) i!822)))))

(declare-fun b!975165 () Bool)

(assert (=> b!975165 (= e!549582 tp_is_empty!22387)))

(declare-fun mapIsEmpty!35590 () Bool)

(assert (=> mapIsEmpty!35590 mapRes!35590))

(declare-fun b!975166 () Bool)

(assert (=> b!975166 (= e!549578 (and e!549580 mapRes!35590))))

(declare-fun condMapEmpty!35590 () Bool)

(declare-fun mapDefault!35590 () ValueCell!10712)

(assert (=> b!975166 (= condMapEmpty!35590 (= (arr!29231 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10712)) mapDefault!35590)))))

(declare-fun b!975167 () Bool)

(declare-fun res!652843 () Bool)

(assert (=> b!975167 (=> (not res!652843) (not e!549581))))

(declare-datatypes ((List!20330 0))(
  ( (Nil!20327) (Cons!20326 (h!21488 (_ BitVec 64)) (t!28798 List!20330)) )
))
(declare-fun arrayNoDuplicates!0 (array!60736 (_ BitVec 32) List!20330) Bool)

(assert (=> b!975167 (= res!652843 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20327))))

(assert (= (and start!83478 res!652840) b!975162))

(assert (= (and b!975162 res!652845) b!975159))

(assert (= (and b!975159 res!652844) b!975167))

(assert (= (and b!975167 res!652843) b!975160))

(assert (= (and b!975160 res!652846) b!975164))

(assert (= (and b!975164 res!652842) b!975163))

(assert (= (and b!975163 res!652841) b!975158))

(assert (= (and b!975166 condMapEmpty!35590) mapIsEmpty!35590))

(assert (= (and b!975166 (not condMapEmpty!35590)) mapNonEmpty!35590))

(get-info :version)

(assert (= (and mapNonEmpty!35590 ((_ is ValueCellFull!10712) mapValue!35590)) b!975165))

(assert (= (and b!975166 ((_ is ValueCellFull!10712) mapDefault!35590)) b!975161))

(assert (= start!83478 b!975166))

(declare-fun m!901895 () Bool)

(assert (=> mapNonEmpty!35590 m!901895))

(declare-fun m!901897 () Bool)

(assert (=> b!975163 m!901897))

(declare-fun m!901899 () Bool)

(assert (=> b!975163 m!901899))

(assert (=> b!975163 m!901897))

(assert (=> b!975163 m!901899))

(declare-fun m!901901 () Bool)

(assert (=> b!975163 m!901901))

(declare-fun m!901903 () Bool)

(assert (=> b!975167 m!901903))

(declare-fun m!901905 () Bool)

(assert (=> start!83478 m!901905))

(declare-fun m!901907 () Bool)

(assert (=> start!83478 m!901907))

(declare-fun m!901909 () Bool)

(assert (=> start!83478 m!901909))

(declare-fun m!901911 () Bool)

(assert (=> b!975158 m!901911))

(declare-fun m!901913 () Bool)

(assert (=> b!975159 m!901913))

(assert (=> b!975164 m!901899))

(assert (=> b!975164 m!901899))

(declare-fun m!901915 () Bool)

(assert (=> b!975164 m!901915))

(check-sat (not mapNonEmpty!35590) (not b!975159) (not b!975163) (not b!975167) tp_is_empty!22387 (not b!975158) b_and!31059 (not start!83478) (not b_next!19483) (not b!975164))
(check-sat b_and!31059 (not b_next!19483))
