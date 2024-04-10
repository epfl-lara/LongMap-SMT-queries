; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83144 () Bool)

(assert start!83144)

(declare-fun b_free!19137 () Bool)

(declare-fun b_next!19137 () Bool)

(assert (=> start!83144 (= b_free!19137 (not b_next!19137))))

(declare-fun tp!66690 () Bool)

(declare-fun b_and!30625 () Bool)

(assert (=> start!83144 (= tp!66690 b_and!30625)))

(declare-fun res!649196 () Bool)

(declare-fun e!546827 () Bool)

(assert (=> start!83144 (=> (not res!649196) (not e!546827))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83144 (= res!649196 (validMask!0 mask!2147))))

(assert (=> start!83144 e!546827))

(assert (=> start!83144 true))

(declare-datatypes ((V!34363 0))(
  ( (V!34364 (val!11068 Int)) )
))
(declare-datatypes ((ValueCell!10536 0))(
  ( (ValueCellFull!10536 (v!13627 V!34363)) (EmptyCell!10536) )
))
(declare-datatypes ((array!60131 0))(
  ( (array!60132 (arr!28929 (Array (_ BitVec 32) ValueCell!10536)) (size!29408 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60131)

(declare-fun e!546828 () Bool)

(declare-fun array_inv!22393 (array!60131) Bool)

(assert (=> start!83144 (and (array_inv!22393 _values!1425) e!546828)))

(declare-fun tp_is_empty!22035 () Bool)

(assert (=> start!83144 tp_is_empty!22035))

(assert (=> start!83144 tp!66690))

(declare-datatypes ((array!60133 0))(
  ( (array!60134 (arr!28930 (Array (_ BitVec 32) (_ BitVec 64))) (size!29409 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60133)

(declare-fun array_inv!22394 (array!60133) Bool)

(assert (=> start!83144 (array_inv!22394 _keys!1717)))

(declare-fun b!969944 () Bool)

(declare-fun res!649197 () Bool)

(assert (=> b!969944 (=> (not res!649197) (not e!546827))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60133 (_ BitVec 32)) Bool)

(assert (=> b!969944 (= res!649197 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!969945 () Bool)

(declare-fun res!649195 () Bool)

(assert (=> b!969945 (=> (not res!649195) (not e!546827))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!969945 (= res!649195 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29409 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29409 _keys!1717))))))

(declare-fun mapIsEmpty!35062 () Bool)

(declare-fun mapRes!35062 () Bool)

(assert (=> mapIsEmpty!35062 mapRes!35062))

(declare-fun b!969946 () Bool)

(declare-fun res!649198 () Bool)

(assert (=> b!969946 (=> (not res!649198) (not e!546827))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!969946 (= res!649198 (and (= (size!29408 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29409 _keys!1717) (size!29408 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969947 () Bool)

(declare-fun e!546829 () Bool)

(assert (=> b!969947 (= e!546829 tp_is_empty!22035)))

(declare-fun b!969948 () Bool)

(declare-fun res!649199 () Bool)

(assert (=> b!969948 (=> (not res!649199) (not e!546827))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!969948 (= res!649199 (validKeyInArray!0 (select (arr!28930 _keys!1717) i!822)))))

(declare-fun b!969949 () Bool)

(assert (=> b!969949 (= e!546827 false)))

(declare-fun zeroValue!1367 () V!34363)

(declare-fun lt!431693 () Bool)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34363)

(declare-datatypes ((tuple2!14178 0))(
  ( (tuple2!14179 (_1!7100 (_ BitVec 64)) (_2!7100 V!34363)) )
))
(declare-datatypes ((List!20048 0))(
  ( (Nil!20045) (Cons!20044 (h!21206 tuple2!14178) (t!28411 List!20048)) )
))
(declare-datatypes ((ListLongMap!12875 0))(
  ( (ListLongMap!12876 (toList!6453 List!20048)) )
))
(declare-fun contains!5557 (ListLongMap!12875 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3686 (array!60133 array!60131 (_ BitVec 32) (_ BitVec 32) V!34363 V!34363 (_ BitVec 32) Int) ListLongMap!12875)

(assert (=> b!969949 (= lt!431693 (contains!5557 (getCurrentListMap!3686 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28930 _keys!1717) i!822)))))

(declare-fun b!969950 () Bool)

(declare-fun e!546825 () Bool)

(assert (=> b!969950 (= e!546828 (and e!546825 mapRes!35062))))

(declare-fun condMapEmpty!35062 () Bool)

(declare-fun mapDefault!35062 () ValueCell!10536)

(assert (=> b!969950 (= condMapEmpty!35062 (= (arr!28929 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10536)) mapDefault!35062)))))

(declare-fun b!969951 () Bool)

(declare-fun res!649200 () Bool)

(assert (=> b!969951 (=> (not res!649200) (not e!546827))))

(declare-datatypes ((List!20049 0))(
  ( (Nil!20046) (Cons!20045 (h!21207 (_ BitVec 64)) (t!28412 List!20049)) )
))
(declare-fun arrayNoDuplicates!0 (array!60133 (_ BitVec 32) List!20049) Bool)

(assert (=> b!969951 (= res!649200 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20046))))

(declare-fun mapNonEmpty!35062 () Bool)

(declare-fun tp!66689 () Bool)

(assert (=> mapNonEmpty!35062 (= mapRes!35062 (and tp!66689 e!546829))))

(declare-fun mapRest!35062 () (Array (_ BitVec 32) ValueCell!10536))

(declare-fun mapValue!35062 () ValueCell!10536)

(declare-fun mapKey!35062 () (_ BitVec 32))

(assert (=> mapNonEmpty!35062 (= (arr!28929 _values!1425) (store mapRest!35062 mapKey!35062 mapValue!35062))))

(declare-fun b!969952 () Bool)

(assert (=> b!969952 (= e!546825 tp_is_empty!22035)))

(assert (= (and start!83144 res!649196) b!969946))

(assert (= (and b!969946 res!649198) b!969944))

(assert (= (and b!969944 res!649197) b!969951))

(assert (= (and b!969951 res!649200) b!969945))

(assert (= (and b!969945 res!649195) b!969948))

(assert (= (and b!969948 res!649199) b!969949))

(assert (= (and b!969950 condMapEmpty!35062) mapIsEmpty!35062))

(assert (= (and b!969950 (not condMapEmpty!35062)) mapNonEmpty!35062))

(get-info :version)

(assert (= (and mapNonEmpty!35062 ((_ is ValueCellFull!10536) mapValue!35062)) b!969947))

(assert (= (and b!969950 ((_ is ValueCellFull!10536) mapDefault!35062)) b!969952))

(assert (= start!83144 b!969950))

(declare-fun m!897807 () Bool)

(assert (=> b!969951 m!897807))

(declare-fun m!897809 () Bool)

(assert (=> start!83144 m!897809))

(declare-fun m!897811 () Bool)

(assert (=> start!83144 m!897811))

(declare-fun m!897813 () Bool)

(assert (=> start!83144 m!897813))

(declare-fun m!897815 () Bool)

(assert (=> b!969948 m!897815))

(assert (=> b!969948 m!897815))

(declare-fun m!897817 () Bool)

(assert (=> b!969948 m!897817))

(declare-fun m!897819 () Bool)

(assert (=> mapNonEmpty!35062 m!897819))

(declare-fun m!897821 () Bool)

(assert (=> b!969944 m!897821))

(declare-fun m!897823 () Bool)

(assert (=> b!969949 m!897823))

(assert (=> b!969949 m!897815))

(assert (=> b!969949 m!897823))

(assert (=> b!969949 m!897815))

(declare-fun m!897825 () Bool)

(assert (=> b!969949 m!897825))

(check-sat (not b!969948) (not b_next!19137) (not b!969951) b_and!30625 (not start!83144) tp_is_empty!22035 (not b!969949) (not b!969944) (not mapNonEmpty!35062))
(check-sat b_and!30625 (not b_next!19137))
