; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82436 () Bool)

(assert start!82436)

(declare-fun b_free!18541 () Bool)

(declare-fun b_next!18541 () Bool)

(assert (=> start!82436 (= b_free!18541 (not b_next!18541))))

(declare-fun tp!64584 () Bool)

(declare-fun b_and!30039 () Bool)

(assert (=> start!82436 (= tp!64584 b_and!30039)))

(declare-fun b!959905 () Bool)

(declare-fun res!642271 () Bool)

(declare-fun e!541210 () Bool)

(assert (=> b!959905 (=> (not res!642271) (not e!541210))))

(declare-datatypes ((array!58622 0))(
  ( (array!58623 (arr!28180 (Array (_ BitVec 32) (_ BitVec 64))) (size!28660 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58622)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!959905 (= res!642271 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28660 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28660 _keys!1668))))))

(declare-fun b!959906 () Bool)

(declare-fun e!541208 () Bool)

(declare-fun tp_is_empty!21247 () Bool)

(assert (=> b!959906 (= e!541208 tp_is_empty!21247)))

(declare-fun b!959907 () Bool)

(declare-fun res!642273 () Bool)

(assert (=> b!959907 (=> (not res!642273) (not e!541210))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959907 (= res!642273 (validKeyInArray!0 (select (arr!28180 _keys!1668) i!793)))))

(declare-fun res!642274 () Bool)

(assert (=> start!82436 (=> (not res!642274) (not e!541210))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82436 (= res!642274 (validMask!0 mask!2088))))

(assert (=> start!82436 e!541210))

(assert (=> start!82436 true))

(assert (=> start!82436 tp_is_empty!21247))

(declare-fun array_inv!21925 (array!58622) Bool)

(assert (=> start!82436 (array_inv!21925 _keys!1668)))

(declare-datatypes ((V!33313 0))(
  ( (V!33314 (val!10674 Int)) )
))
(declare-datatypes ((ValueCell!10142 0))(
  ( (ValueCellFull!10142 (v!13228 V!33313)) (EmptyCell!10142) )
))
(declare-datatypes ((array!58624 0))(
  ( (array!58625 (arr!28181 (Array (_ BitVec 32) ValueCell!10142)) (size!28661 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58624)

(declare-fun e!541209 () Bool)

(declare-fun array_inv!21926 (array!58624) Bool)

(assert (=> start!82436 (and (array_inv!21926 _values!1386) e!541209)))

(assert (=> start!82436 tp!64584))

(declare-fun b!959908 () Bool)

(declare-fun res!642276 () Bool)

(assert (=> b!959908 (=> (not res!642276) (not e!541210))))

(declare-fun minValue!1328 () V!33313)

(declare-fun zeroValue!1328 () V!33313)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun defaultEntry!1389 () Int)

(declare-datatypes ((tuple2!13750 0))(
  ( (tuple2!13751 (_1!6886 (_ BitVec 64)) (_2!6886 V!33313)) )
))
(declare-datatypes ((List!19580 0))(
  ( (Nil!19577) (Cons!19576 (h!20744 tuple2!13750) (t!27935 List!19580)) )
))
(declare-datatypes ((ListLongMap!12449 0))(
  ( (ListLongMap!12450 (toList!6240 List!19580)) )
))
(declare-fun contains!5354 (ListLongMap!12449 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3473 (array!58622 array!58624 (_ BitVec 32) (_ BitVec 32) V!33313 V!33313 (_ BitVec 32) Int) ListLongMap!12449)

(assert (=> b!959908 (= res!642276 (contains!5354 (getCurrentListMap!3473 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28180 _keys!1668) i!793)))))

(declare-fun mapNonEmpty!33850 () Bool)

(declare-fun mapRes!33850 () Bool)

(declare-fun tp!64585 () Bool)

(declare-fun e!541212 () Bool)

(assert (=> mapNonEmpty!33850 (= mapRes!33850 (and tp!64585 e!541212))))

(declare-fun mapRest!33850 () (Array (_ BitVec 32) ValueCell!10142))

(declare-fun mapValue!33850 () ValueCell!10142)

(declare-fun mapKey!33850 () (_ BitVec 32))

(assert (=> mapNonEmpty!33850 (= (arr!28181 _values!1386) (store mapRest!33850 mapKey!33850 mapValue!33850))))

(declare-fun b!959909 () Bool)

(assert (=> b!959909 (= e!541209 (and e!541208 mapRes!33850))))

(declare-fun condMapEmpty!33850 () Bool)

(declare-fun mapDefault!33850 () ValueCell!10142)

(assert (=> b!959909 (= condMapEmpty!33850 (= (arr!28181 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10142)) mapDefault!33850)))))

(declare-fun b!959910 () Bool)

(assert (=> b!959910 (= e!541212 tp_is_empty!21247)))

(declare-fun b!959911 () Bool)

(declare-fun res!642272 () Bool)

(assert (=> b!959911 (=> (not res!642272) (not e!541210))))

(assert (=> b!959911 (= res!642272 (and (= (size!28661 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28660 _keys!1668) (size!28661 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!959912 () Bool)

(assert (=> b!959912 (= e!541210 (not true))))

(assert (=> b!959912 (contains!5354 (getCurrentListMap!3473 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28180 _keys!1668) i!793))))

(declare-datatypes ((Unit!32134 0))(
  ( (Unit!32135) )
))
(declare-fun lt!430864 () Unit!32134)

(declare-fun lemmaInListMapFromThenInFromSmaller!5 (array!58622 array!58624 (_ BitVec 32) (_ BitVec 32) V!33313 V!33313 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32134)

(assert (=> b!959912 (= lt!430864 (lemmaInListMapFromThenInFromSmaller!5 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun b!959913 () Bool)

(declare-fun res!642277 () Bool)

(assert (=> b!959913 (=> (not res!642277) (not e!541210))))

(declare-datatypes ((List!19581 0))(
  ( (Nil!19578) (Cons!19577 (h!20745 (_ BitVec 64)) (t!27936 List!19581)) )
))
(declare-fun arrayNoDuplicates!0 (array!58622 (_ BitVec 32) List!19581) Bool)

(assert (=> b!959913 (= res!642277 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19578))))

(declare-fun b!959914 () Bool)

(declare-fun res!642275 () Bool)

(assert (=> b!959914 (=> (not res!642275) (not e!541210))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58622 (_ BitVec 32)) Bool)

(assert (=> b!959914 (= res!642275 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapIsEmpty!33850 () Bool)

(assert (=> mapIsEmpty!33850 mapRes!33850))

(assert (= (and start!82436 res!642274) b!959911))

(assert (= (and b!959911 res!642272) b!959914))

(assert (= (and b!959914 res!642275) b!959913))

(assert (= (and b!959913 res!642277) b!959905))

(assert (= (and b!959905 res!642271) b!959907))

(assert (= (and b!959907 res!642273) b!959908))

(assert (= (and b!959908 res!642276) b!959912))

(assert (= (and b!959909 condMapEmpty!33850) mapIsEmpty!33850))

(assert (= (and b!959909 (not condMapEmpty!33850)) mapNonEmpty!33850))

(get-info :version)

(assert (= (and mapNonEmpty!33850 ((_ is ValueCellFull!10142) mapValue!33850)) b!959910))

(assert (= (and b!959909 ((_ is ValueCellFull!10142) mapDefault!33850)) b!959906))

(assert (= start!82436 b!959909))

(declare-fun m!890847 () Bool)

(assert (=> b!959907 m!890847))

(assert (=> b!959907 m!890847))

(declare-fun m!890849 () Bool)

(assert (=> b!959907 m!890849))

(declare-fun m!890851 () Bool)

(assert (=> b!959908 m!890851))

(assert (=> b!959908 m!890847))

(assert (=> b!959908 m!890851))

(assert (=> b!959908 m!890847))

(declare-fun m!890853 () Bool)

(assert (=> b!959908 m!890853))

(declare-fun m!890855 () Bool)

(assert (=> mapNonEmpty!33850 m!890855))

(declare-fun m!890857 () Bool)

(assert (=> b!959912 m!890857))

(assert (=> b!959912 m!890847))

(assert (=> b!959912 m!890857))

(assert (=> b!959912 m!890847))

(declare-fun m!890859 () Bool)

(assert (=> b!959912 m!890859))

(declare-fun m!890861 () Bool)

(assert (=> b!959912 m!890861))

(declare-fun m!890863 () Bool)

(assert (=> b!959913 m!890863))

(declare-fun m!890865 () Bool)

(assert (=> b!959914 m!890865))

(declare-fun m!890867 () Bool)

(assert (=> start!82436 m!890867))

(declare-fun m!890869 () Bool)

(assert (=> start!82436 m!890869))

(declare-fun m!890871 () Bool)

(assert (=> start!82436 m!890871))

(check-sat (not b!959912) (not b!959908) (not b!959914) (not b!959907) (not b!959913) (not mapNonEmpty!33850) (not b_next!18541) (not start!82436) tp_is_empty!21247 b_and!30039)
(check-sat b_and!30039 (not b_next!18541))
