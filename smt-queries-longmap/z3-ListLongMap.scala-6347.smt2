; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81800 () Bool)

(assert start!81800)

(declare-fun b_free!18313 () Bool)

(declare-fun b_next!18313 () Bool)

(assert (=> start!81800 (= b_free!18313 (not b_next!18313))))

(declare-fun tp!63640 () Bool)

(declare-fun b_and!29773 () Bool)

(assert (=> start!81800 (= tp!63640 b_and!29773)))

(declare-fun b!953864 () Bool)

(declare-fun res!638802 () Bool)

(declare-fun e!537388 () Bool)

(assert (=> b!953864 (=> (not res!638802) (not e!537388))))

(declare-datatypes ((array!57788 0))(
  ( (array!57789 (arr!27774 (Array (_ BitVec 32) (_ BitVec 64))) (size!28255 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57788)

(declare-fun i!735 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!953864 (= res!638802 (validKeyInArray!0 (select (arr!27774 _keys!1441) i!735)))))

(declare-fun b!953865 () Bool)

(declare-fun e!537390 () Bool)

(declare-fun tp_is_empty!20857 () Bool)

(assert (=> b!953865 (= e!537390 tp_is_empty!20857)))

(declare-fun mapNonEmpty!33247 () Bool)

(declare-fun mapRes!33247 () Bool)

(declare-fun tp!63639 () Bool)

(declare-fun e!537386 () Bool)

(assert (=> mapNonEmpty!33247 (= mapRes!33247 (and tp!63639 e!537386))))

(declare-fun mapKey!33247 () (_ BitVec 32))

(declare-datatypes ((V!32793 0))(
  ( (V!32794 (val!10479 Int)) )
))
(declare-datatypes ((ValueCell!9947 0))(
  ( (ValueCellFull!9947 (v!13033 V!32793)) (EmptyCell!9947) )
))
(declare-fun mapRest!33247 () (Array (_ BitVec 32) ValueCell!9947))

(declare-datatypes ((array!57790 0))(
  ( (array!57791 (arr!27775 (Array (_ BitVec 32) ValueCell!9947)) (size!28256 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57790)

(declare-fun mapValue!33247 () ValueCell!9947)

(assert (=> mapNonEmpty!33247 (= (arr!27775 _values!1197) (store mapRest!33247 mapKey!33247 mapValue!33247))))

(declare-fun b!953866 () Bool)

(declare-fun e!537387 () Bool)

(assert (=> b!953866 (= e!537387 (and e!537390 mapRes!33247))))

(declare-fun condMapEmpty!33247 () Bool)

(declare-fun mapDefault!33247 () ValueCell!9947)

(assert (=> b!953866 (= condMapEmpty!33247 (= (arr!27775 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9947)) mapDefault!33247)))))

(declare-fun b!953867 () Bool)

(declare-fun res!638806 () Bool)

(assert (=> b!953867 (=> (not res!638806) (not e!537388))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57788 (_ BitVec 32)) Bool)

(assert (=> b!953867 (= res!638806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!953868 () Bool)

(declare-fun res!638803 () Bool)

(assert (=> b!953868 (=> (not res!638803) (not e!537388))))

(assert (=> b!953868 (= res!638803 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28255 _keys!1441))))))

(declare-fun b!953869 () Bool)

(declare-fun res!638801 () Bool)

(assert (=> b!953869 (=> (not res!638801) (not e!537388))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!953869 (= res!638801 (and (= (size!28256 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28255 _keys!1441) (size!28256 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!953870 () Bool)

(assert (=> b!953870 (= e!537386 tp_is_empty!20857)))

(declare-fun b!953871 () Bool)

(assert (=> b!953871 (= e!537388 false)))

(declare-fun zeroValue!1139 () V!32793)

(declare-fun lt!429627 () Bool)

(declare-fun minValue!1139 () V!32793)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13646 0))(
  ( (tuple2!13647 (_1!6834 (_ BitVec 64)) (_2!6834 V!32793)) )
))
(declare-datatypes ((List!19385 0))(
  ( (Nil!19382) (Cons!19381 (h!20543 tuple2!13646) (t!27737 List!19385)) )
))
(declare-datatypes ((ListLongMap!12333 0))(
  ( (ListLongMap!12334 (toList!6182 List!19385)) )
))
(declare-fun contains!5223 (ListLongMap!12333 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3344 (array!57788 array!57790 (_ BitVec 32) (_ BitVec 32) V!32793 V!32793 (_ BitVec 32) Int) ListLongMap!12333)

(assert (=> b!953871 (= lt!429627 (contains!5223 (getCurrentListMap!3344 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27774 _keys!1441) i!735)))))

(declare-fun b!953872 () Bool)

(declare-fun res!638805 () Bool)

(assert (=> b!953872 (=> (not res!638805) (not e!537388))))

(declare-datatypes ((List!19386 0))(
  ( (Nil!19383) (Cons!19382 (h!20544 (_ BitVec 64)) (t!27738 List!19386)) )
))
(declare-fun arrayNoDuplicates!0 (array!57788 (_ BitVec 32) List!19386) Bool)

(assert (=> b!953872 (= res!638805 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19383))))

(declare-fun res!638804 () Bool)

(assert (=> start!81800 (=> (not res!638804) (not e!537388))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81800 (= res!638804 (validMask!0 mask!1823))))

(assert (=> start!81800 e!537388))

(assert (=> start!81800 true))

(assert (=> start!81800 tp_is_empty!20857))

(declare-fun array_inv!21621 (array!57788) Bool)

(assert (=> start!81800 (array_inv!21621 _keys!1441)))

(declare-fun array_inv!21622 (array!57790) Bool)

(assert (=> start!81800 (and (array_inv!21622 _values!1197) e!537387)))

(assert (=> start!81800 tp!63640))

(declare-fun mapIsEmpty!33247 () Bool)

(assert (=> mapIsEmpty!33247 mapRes!33247))

(assert (= (and start!81800 res!638804) b!953869))

(assert (= (and b!953869 res!638801) b!953867))

(assert (= (and b!953867 res!638806) b!953872))

(assert (= (and b!953872 res!638805) b!953868))

(assert (= (and b!953868 res!638803) b!953864))

(assert (= (and b!953864 res!638802) b!953871))

(assert (= (and b!953866 condMapEmpty!33247) mapIsEmpty!33247))

(assert (= (and b!953866 (not condMapEmpty!33247)) mapNonEmpty!33247))

(get-info :version)

(assert (= (and mapNonEmpty!33247 ((_ is ValueCellFull!9947) mapValue!33247)) b!953870))

(assert (= (and b!953866 ((_ is ValueCellFull!9947) mapDefault!33247)) b!953865))

(assert (= start!81800 b!953866))

(declare-fun m!885165 () Bool)

(assert (=> start!81800 m!885165))

(declare-fun m!885167 () Bool)

(assert (=> start!81800 m!885167))

(declare-fun m!885169 () Bool)

(assert (=> start!81800 m!885169))

(declare-fun m!885171 () Bool)

(assert (=> b!953864 m!885171))

(assert (=> b!953864 m!885171))

(declare-fun m!885173 () Bool)

(assert (=> b!953864 m!885173))

(declare-fun m!885175 () Bool)

(assert (=> b!953871 m!885175))

(assert (=> b!953871 m!885171))

(assert (=> b!953871 m!885175))

(assert (=> b!953871 m!885171))

(declare-fun m!885177 () Bool)

(assert (=> b!953871 m!885177))

(declare-fun m!885179 () Bool)

(assert (=> mapNonEmpty!33247 m!885179))

(declare-fun m!885181 () Bool)

(assert (=> b!953867 m!885181))

(declare-fun m!885183 () Bool)

(assert (=> b!953872 m!885183))

(check-sat (not b!953867) (not mapNonEmpty!33247) (not b!953871) (not b!953872) (not start!81800) tp_is_empty!20857 (not b!953864) (not b_next!18313) b_and!29773)
(check-sat b_and!29773 (not b_next!18313))
