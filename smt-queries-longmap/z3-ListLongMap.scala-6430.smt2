; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82358 () Bool)

(assert start!82358)

(declare-fun b_free!18643 () Bool)

(declare-fun b_next!18643 () Bool)

(assert (=> start!82358 (= b_free!18643 (not b_next!18643))))

(declare-fun tp!64900 () Bool)

(declare-fun b_and!30105 () Bool)

(assert (=> start!82358 (= tp!64900 b_and!30105)))

(declare-fun b!960264 () Bool)

(declare-fun e!541288 () Bool)

(assert (=> b!960264 (= e!541288 false)))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-datatypes ((V!33457 0))(
  ( (V!33458 (val!10728 Int)) )
))
(declare-fun minValue!1328 () V!33457)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun lt!430420 () Bool)

(declare-datatypes ((array!58736 0))(
  ( (array!58737 (arr!28242 (Array (_ BitVec 32) (_ BitVec 64))) (size!28723 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58736)

(declare-datatypes ((ValueCell!10196 0))(
  ( (ValueCellFull!10196 (v!13284 V!33457)) (EmptyCell!10196) )
))
(declare-datatypes ((array!58738 0))(
  ( (array!58739 (arr!28243 (Array (_ BitVec 32) ValueCell!10196)) (size!28724 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58738)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33457)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13890 0))(
  ( (tuple2!13891 (_1!6956 (_ BitVec 64)) (_2!6956 V!33457)) )
))
(declare-datatypes ((List!19674 0))(
  ( (Nil!19671) (Cons!19670 (h!20832 tuple2!13890) (t!28028 List!19674)) )
))
(declare-datatypes ((ListLongMap!12577 0))(
  ( (ListLongMap!12578 (toList!6304 List!19674)) )
))
(declare-fun contains!5347 (ListLongMap!12577 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3466 (array!58736 array!58738 (_ BitVec 32) (_ BitVec 32) V!33457 V!33457 (_ BitVec 32) Int) ListLongMap!12577)

(assert (=> b!960264 (= lt!430420 (contains!5347 (getCurrentListMap!3466 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28242 _keys!1668) i!793)))))

(declare-fun b!960265 () Bool)

(declare-fun e!541291 () Bool)

(declare-fun tp_is_empty!21355 () Bool)

(assert (=> b!960265 (= e!541291 tp_is_empty!21355)))

(declare-fun b!960266 () Bool)

(declare-fun res!642832 () Bool)

(assert (=> b!960266 (=> (not res!642832) (not e!541288))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58736 (_ BitVec 32)) Bool)

(assert (=> b!960266 (= res!642832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!960267 () Bool)

(declare-fun res!642835 () Bool)

(assert (=> b!960267 (=> (not res!642835) (not e!541288))))

(assert (=> b!960267 (= res!642835 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28723 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28723 _keys!1668))))))

(declare-fun res!642836 () Bool)

(assert (=> start!82358 (=> (not res!642836) (not e!541288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82358 (= res!642836 (validMask!0 mask!2088))))

(assert (=> start!82358 e!541288))

(assert (=> start!82358 true))

(assert (=> start!82358 tp_is_empty!21355))

(declare-fun array_inv!21949 (array!58736) Bool)

(assert (=> start!82358 (array_inv!21949 _keys!1668)))

(declare-fun e!541292 () Bool)

(declare-fun array_inv!21950 (array!58738) Bool)

(assert (=> start!82358 (and (array_inv!21950 _values!1386) e!541292)))

(assert (=> start!82358 tp!64900))

(declare-fun mapIsEmpty!34012 () Bool)

(declare-fun mapRes!34012 () Bool)

(assert (=> mapIsEmpty!34012 mapRes!34012))

(declare-fun b!960268 () Bool)

(declare-fun e!541289 () Bool)

(assert (=> b!960268 (= e!541289 tp_is_empty!21355)))

(declare-fun b!960269 () Bool)

(assert (=> b!960269 (= e!541292 (and e!541289 mapRes!34012))))

(declare-fun condMapEmpty!34012 () Bool)

(declare-fun mapDefault!34012 () ValueCell!10196)

(assert (=> b!960269 (= condMapEmpty!34012 (= (arr!28243 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10196)) mapDefault!34012)))))

(declare-fun mapNonEmpty!34012 () Bool)

(declare-fun tp!64899 () Bool)

(assert (=> mapNonEmpty!34012 (= mapRes!34012 (and tp!64899 e!541291))))

(declare-fun mapRest!34012 () (Array (_ BitVec 32) ValueCell!10196))

(declare-fun mapKey!34012 () (_ BitVec 32))

(declare-fun mapValue!34012 () ValueCell!10196)

(assert (=> mapNonEmpty!34012 (= (arr!28243 _values!1386) (store mapRest!34012 mapKey!34012 mapValue!34012))))

(declare-fun b!960270 () Bool)

(declare-fun res!642833 () Bool)

(assert (=> b!960270 (=> (not res!642833) (not e!541288))))

(declare-datatypes ((List!19675 0))(
  ( (Nil!19672) (Cons!19671 (h!20833 (_ BitVec 64)) (t!28029 List!19675)) )
))
(declare-fun arrayNoDuplicates!0 (array!58736 (_ BitVec 32) List!19675) Bool)

(assert (=> b!960270 (= res!642833 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19672))))

(declare-fun b!960271 () Bool)

(declare-fun res!642837 () Bool)

(assert (=> b!960271 (=> (not res!642837) (not e!541288))))

(assert (=> b!960271 (= res!642837 (and (= (size!28724 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28723 _keys!1668) (size!28724 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!960272 () Bool)

(declare-fun res!642834 () Bool)

(assert (=> b!960272 (=> (not res!642834) (not e!541288))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960272 (= res!642834 (validKeyInArray!0 (select (arr!28242 _keys!1668) i!793)))))

(assert (= (and start!82358 res!642836) b!960271))

(assert (= (and b!960271 res!642837) b!960266))

(assert (= (and b!960266 res!642832) b!960270))

(assert (= (and b!960270 res!642833) b!960267))

(assert (= (and b!960267 res!642835) b!960272))

(assert (= (and b!960272 res!642834) b!960264))

(assert (= (and b!960269 condMapEmpty!34012) mapIsEmpty!34012))

(assert (= (and b!960269 (not condMapEmpty!34012)) mapNonEmpty!34012))

(get-info :version)

(assert (= (and mapNonEmpty!34012 ((_ is ValueCellFull!10196) mapValue!34012)) b!960265))

(assert (= (and b!960269 ((_ is ValueCellFull!10196) mapDefault!34012)) b!960268))

(assert (= start!82358 b!960269))

(declare-fun m!889971 () Bool)

(assert (=> mapNonEmpty!34012 m!889971))

(declare-fun m!889973 () Bool)

(assert (=> b!960264 m!889973))

(declare-fun m!889975 () Bool)

(assert (=> b!960264 m!889975))

(assert (=> b!960264 m!889973))

(assert (=> b!960264 m!889975))

(declare-fun m!889977 () Bool)

(assert (=> b!960264 m!889977))

(declare-fun m!889979 () Bool)

(assert (=> start!82358 m!889979))

(declare-fun m!889981 () Bool)

(assert (=> start!82358 m!889981))

(declare-fun m!889983 () Bool)

(assert (=> start!82358 m!889983))

(declare-fun m!889985 () Bool)

(assert (=> b!960266 m!889985))

(assert (=> b!960272 m!889975))

(assert (=> b!960272 m!889975))

(declare-fun m!889987 () Bool)

(assert (=> b!960272 m!889987))

(declare-fun m!889989 () Bool)

(assert (=> b!960270 m!889989))

(check-sat b_and!30105 (not b!960270) (not start!82358) (not mapNonEmpty!34012) tp_is_empty!21355 (not b!960266) (not b_next!18643) (not b!960264) (not b!960272))
(check-sat b_and!30105 (not b_next!18643))
