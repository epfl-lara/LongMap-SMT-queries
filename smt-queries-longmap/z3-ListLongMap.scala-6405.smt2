; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82208 () Bool)

(assert start!82208)

(declare-fun b_free!18499 () Bool)

(declare-fun b_next!18499 () Bool)

(assert (=> start!82208 (= b_free!18499 (not b_next!18499))))

(declare-fun tp!64459 () Bool)

(declare-fun b_and!29961 () Bool)

(assert (=> start!82208 (= tp!64459 b_and!29961)))

(declare-fun b!958176 () Bool)

(declare-fun e!540166 () Bool)

(declare-fun e!540167 () Bool)

(declare-fun mapRes!33787 () Bool)

(assert (=> b!958176 (= e!540166 (and e!540167 mapRes!33787))))

(declare-fun condMapEmpty!33787 () Bool)

(declare-datatypes ((V!33257 0))(
  ( (V!33258 (val!10653 Int)) )
))
(declare-datatypes ((ValueCell!10121 0))(
  ( (ValueCellFull!10121 (v!13209 V!33257)) (EmptyCell!10121) )
))
(declare-datatypes ((array!58448 0))(
  ( (array!58449 (arr!28098 (Array (_ BitVec 32) ValueCell!10121)) (size!28579 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58448)

(declare-fun mapDefault!33787 () ValueCell!10121)

(assert (=> b!958176 (= condMapEmpty!33787 (= (arr!28098 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10121)) mapDefault!33787)))))

(declare-fun b!958177 () Bool)

(declare-fun tp_is_empty!21205 () Bool)

(assert (=> b!958177 (= e!540167 tp_is_empty!21205)))

(declare-fun b!958178 () Bool)

(declare-fun res!641424 () Bool)

(declare-fun e!540164 () Bool)

(assert (=> b!958178 (=> (not res!641424) (not e!540164))))

(declare-datatypes ((array!58450 0))(
  ( (array!58451 (arr!28099 (Array (_ BitVec 32) (_ BitVec 64))) (size!28580 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58450)

(declare-datatypes ((List!19570 0))(
  ( (Nil!19567) (Cons!19566 (h!20728 (_ BitVec 64)) (t!27924 List!19570)) )
))
(declare-fun arrayNoDuplicates!0 (array!58450 (_ BitVec 32) List!19570) Bool)

(assert (=> b!958178 (= res!641424 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19567))))

(declare-fun res!641419 () Bool)

(assert (=> start!82208 (=> (not res!641419) (not e!540164))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82208 (= res!641419 (validMask!0 mask!2088))))

(assert (=> start!82208 e!540164))

(assert (=> start!82208 true))

(assert (=> start!82208 tp_is_empty!21205))

(declare-fun array_inv!21851 (array!58450) Bool)

(assert (=> start!82208 (array_inv!21851 _keys!1668)))

(declare-fun array_inv!21852 (array!58448) Bool)

(assert (=> start!82208 (and (array_inv!21852 _values!1386) e!540166)))

(assert (=> start!82208 tp!64459))

(declare-fun b!958179 () Bool)

(assert (=> b!958179 (= e!540164 false)))

(declare-fun minValue!1328 () V!33257)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33257)

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun lt!430204 () Bool)

(declare-datatypes ((tuple2!13786 0))(
  ( (tuple2!13787 (_1!6904 (_ BitVec 64)) (_2!6904 V!33257)) )
))
(declare-datatypes ((List!19571 0))(
  ( (Nil!19568) (Cons!19567 (h!20729 tuple2!13786) (t!27925 List!19571)) )
))
(declare-datatypes ((ListLongMap!12473 0))(
  ( (ListLongMap!12474 (toList!6252 List!19571)) )
))
(declare-fun contains!5298 (ListLongMap!12473 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3414 (array!58450 array!58448 (_ BitVec 32) (_ BitVec 32) V!33257 V!33257 (_ BitVec 32) Int) ListLongMap!12473)

(assert (=> b!958179 (= lt!430204 (contains!5298 (getCurrentListMap!3414 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28099 _keys!1668) i!793)))))

(declare-fun b!958180 () Bool)

(declare-fun res!641421 () Bool)

(assert (=> b!958180 (=> (not res!641421) (not e!540164))))

(assert (=> b!958180 (= res!641421 (and (= (size!28579 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28580 _keys!1668) (size!28579 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!958181 () Bool)

(declare-fun res!641420 () Bool)

(assert (=> b!958181 (=> (not res!641420) (not e!540164))))

(assert (=> b!958181 (= res!641420 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28580 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28580 _keys!1668))))))

(declare-fun b!958182 () Bool)

(declare-fun res!641423 () Bool)

(assert (=> b!958182 (=> (not res!641423) (not e!540164))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958182 (= res!641423 (validKeyInArray!0 (select (arr!28099 _keys!1668) i!793)))))

(declare-fun mapIsEmpty!33787 () Bool)

(assert (=> mapIsEmpty!33787 mapRes!33787))

(declare-fun b!958183 () Bool)

(declare-fun e!540165 () Bool)

(assert (=> b!958183 (= e!540165 tp_is_empty!21205)))

(declare-fun mapNonEmpty!33787 () Bool)

(declare-fun tp!64458 () Bool)

(assert (=> mapNonEmpty!33787 (= mapRes!33787 (and tp!64458 e!540165))))

(declare-fun mapValue!33787 () ValueCell!10121)

(declare-fun mapKey!33787 () (_ BitVec 32))

(declare-fun mapRest!33787 () (Array (_ BitVec 32) ValueCell!10121))

(assert (=> mapNonEmpty!33787 (= (arr!28098 _values!1386) (store mapRest!33787 mapKey!33787 mapValue!33787))))

(declare-fun b!958184 () Bool)

(declare-fun res!641422 () Bool)

(assert (=> b!958184 (=> (not res!641422) (not e!540164))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58450 (_ BitVec 32)) Bool)

(assert (=> b!958184 (= res!641422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(assert (= (and start!82208 res!641419) b!958180))

(assert (= (and b!958180 res!641421) b!958184))

(assert (= (and b!958184 res!641422) b!958178))

(assert (= (and b!958178 res!641424) b!958181))

(assert (= (and b!958181 res!641420) b!958182))

(assert (= (and b!958182 res!641423) b!958179))

(assert (= (and b!958176 condMapEmpty!33787) mapIsEmpty!33787))

(assert (= (and b!958176 (not condMapEmpty!33787)) mapNonEmpty!33787))

(get-info :version)

(assert (= (and mapNonEmpty!33787 ((_ is ValueCellFull!10121) mapValue!33787)) b!958183))

(assert (= (and b!958176 ((_ is ValueCellFull!10121) mapDefault!33787)) b!958177))

(assert (= start!82208 b!958176))

(declare-fun m!888339 () Bool)

(assert (=> b!958182 m!888339))

(assert (=> b!958182 m!888339))

(declare-fun m!888341 () Bool)

(assert (=> b!958182 m!888341))

(declare-fun m!888343 () Bool)

(assert (=> b!958178 m!888343))

(declare-fun m!888345 () Bool)

(assert (=> b!958184 m!888345))

(declare-fun m!888347 () Bool)

(assert (=> start!82208 m!888347))

(declare-fun m!888349 () Bool)

(assert (=> start!82208 m!888349))

(declare-fun m!888351 () Bool)

(assert (=> start!82208 m!888351))

(declare-fun m!888353 () Bool)

(assert (=> b!958179 m!888353))

(assert (=> b!958179 m!888339))

(assert (=> b!958179 m!888353))

(assert (=> b!958179 m!888339))

(declare-fun m!888355 () Bool)

(assert (=> b!958179 m!888355))

(declare-fun m!888357 () Bool)

(assert (=> mapNonEmpty!33787 m!888357))

(check-sat (not mapNonEmpty!33787) (not b_next!18499) (not b!958184) (not start!82208) (not b!958178) (not b!958179) (not b!958182) tp_is_empty!21205 b_and!29961)
(check-sat b_and!29961 (not b_next!18499))
