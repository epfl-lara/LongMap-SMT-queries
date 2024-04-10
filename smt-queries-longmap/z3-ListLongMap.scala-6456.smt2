; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82578 () Bool)

(assert start!82578)

(declare-fun b_free!18711 () Bool)

(declare-fun b_next!18711 () Bool)

(assert (=> start!82578 (= b_free!18711 (not b_next!18711))))

(declare-fun tp!65252 () Bool)

(declare-fun b_and!30199 () Bool)

(assert (=> start!82578 (= tp!65252 b_and!30199)))

(declare-fun b!962384 () Bool)

(declare-fun e!542720 () Bool)

(assert (=> b!962384 (= e!542720 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33667 0))(
  ( (V!33668 (val!10807 Int)) )
))
(declare-datatypes ((ValueCell!10275 0))(
  ( (ValueCellFull!10275 (v!13365 V!33667)) (EmptyCell!10275) )
))
(declare-datatypes ((array!59123 0))(
  ( (array!59124 (arr!28430 (Array (_ BitVec 32) ValueCell!10275)) (size!28909 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59123)

(declare-datatypes ((array!59125 0))(
  ( (array!59126 (arr!28431 (Array (_ BitVec 32) (_ BitVec 64))) (size!28910 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59125)

(declare-fun minValue!1342 () V!33667)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33667)

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun lt!430870 () Bool)

(declare-fun i!803 () (_ BitVec 32))

(declare-datatypes ((tuple2!13880 0))(
  ( (tuple2!13881 (_1!6951 (_ BitVec 64)) (_2!6951 V!33667)) )
))
(declare-datatypes ((List!19731 0))(
  ( (Nil!19728) (Cons!19727 (h!20889 tuple2!13880) (t!28094 List!19731)) )
))
(declare-datatypes ((ListLongMap!12577 0))(
  ( (ListLongMap!12578 (toList!6304 List!19731)) )
))
(declare-fun contains!5407 (ListLongMap!12577 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3537 (array!59125 array!59123 (_ BitVec 32) (_ BitVec 32) V!33667 V!33667 (_ BitVec 32) Int) ListLongMap!12577)

(assert (=> b!962384 (= lt!430870 (contains!5407 (getCurrentListMap!3537 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28431 _keys!1686) i!803)))))

(declare-fun b!962385 () Bool)

(declare-fun e!542719 () Bool)

(declare-fun e!542716 () Bool)

(declare-fun mapRes!34264 () Bool)

(assert (=> b!962385 (= e!542719 (and e!542716 mapRes!34264))))

(declare-fun condMapEmpty!34264 () Bool)

(declare-fun mapDefault!34264 () ValueCell!10275)

(assert (=> b!962385 (= condMapEmpty!34264 (= (arr!28430 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10275)) mapDefault!34264)))))

(declare-fun b!962386 () Bool)

(declare-fun tp_is_empty!21513 () Bool)

(assert (=> b!962386 (= e!542716 tp_is_empty!21513)))

(declare-fun b!962387 () Bool)

(declare-fun res!644049 () Bool)

(assert (=> b!962387 (=> (not res!644049) (not e!542720))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962387 (= res!644049 (validKeyInArray!0 (select (arr!28431 _keys!1686) i!803)))))

(declare-fun b!962388 () Bool)

(declare-fun e!542718 () Bool)

(assert (=> b!962388 (= e!542718 tp_is_empty!21513)))

(declare-fun b!962389 () Bool)

(declare-fun res!644048 () Bool)

(assert (=> b!962389 (=> (not res!644048) (not e!542720))))

(assert (=> b!962389 (= res!644048 (and (= (size!28909 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28910 _keys!1686) (size!28909 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962390 () Bool)

(declare-fun res!644053 () Bool)

(assert (=> b!962390 (=> (not res!644053) (not e!542720))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!962390 (= res!644053 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28910 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28910 _keys!1686))))))

(declare-fun mapIsEmpty!34264 () Bool)

(assert (=> mapIsEmpty!34264 mapRes!34264))

(declare-fun b!962391 () Bool)

(declare-fun res!644051 () Bool)

(assert (=> b!962391 (=> (not res!644051) (not e!542720))))

(declare-datatypes ((List!19732 0))(
  ( (Nil!19729) (Cons!19728 (h!20890 (_ BitVec 64)) (t!28095 List!19732)) )
))
(declare-fun arrayNoDuplicates!0 (array!59125 (_ BitVec 32) List!19732) Bool)

(assert (=> b!962391 (= res!644051 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19729))))

(declare-fun b!962392 () Bool)

(declare-fun res!644052 () Bool)

(assert (=> b!962392 (=> (not res!644052) (not e!542720))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59125 (_ BitVec 32)) Bool)

(assert (=> b!962392 (= res!644052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapNonEmpty!34264 () Bool)

(declare-fun tp!65253 () Bool)

(assert (=> mapNonEmpty!34264 (= mapRes!34264 (and tp!65253 e!542718))))

(declare-fun mapValue!34264 () ValueCell!10275)

(declare-fun mapRest!34264 () (Array (_ BitVec 32) ValueCell!10275))

(declare-fun mapKey!34264 () (_ BitVec 32))

(assert (=> mapNonEmpty!34264 (= (arr!28430 _values!1400) (store mapRest!34264 mapKey!34264 mapValue!34264))))

(declare-fun res!644050 () Bool)

(assert (=> start!82578 (=> (not res!644050) (not e!542720))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82578 (= res!644050 (validMask!0 mask!2110))))

(assert (=> start!82578 e!542720))

(assert (=> start!82578 true))

(declare-fun array_inv!22029 (array!59123) Bool)

(assert (=> start!82578 (and (array_inv!22029 _values!1400) e!542719)))

(declare-fun array_inv!22030 (array!59125) Bool)

(assert (=> start!82578 (array_inv!22030 _keys!1686)))

(assert (=> start!82578 tp!65252))

(assert (=> start!82578 tp_is_empty!21513))

(assert (= (and start!82578 res!644050) b!962389))

(assert (= (and b!962389 res!644048) b!962392))

(assert (= (and b!962392 res!644052) b!962391))

(assert (= (and b!962391 res!644051) b!962390))

(assert (= (and b!962390 res!644053) b!962387))

(assert (= (and b!962387 res!644049) b!962384))

(assert (= (and b!962385 condMapEmpty!34264) mapIsEmpty!34264))

(assert (= (and b!962385 (not condMapEmpty!34264)) mapNonEmpty!34264))

(get-info :version)

(assert (= (and mapNonEmpty!34264 ((_ is ValueCellFull!10275) mapValue!34264)) b!962388))

(assert (= (and b!962385 ((_ is ValueCellFull!10275) mapDefault!34264)) b!962386))

(assert (= start!82578 b!962385))

(declare-fun m!892049 () Bool)

(assert (=> b!962387 m!892049))

(assert (=> b!962387 m!892049))

(declare-fun m!892051 () Bool)

(assert (=> b!962387 m!892051))

(declare-fun m!892053 () Bool)

(assert (=> b!962391 m!892053))

(declare-fun m!892055 () Bool)

(assert (=> mapNonEmpty!34264 m!892055))

(declare-fun m!892057 () Bool)

(assert (=> start!82578 m!892057))

(declare-fun m!892059 () Bool)

(assert (=> start!82578 m!892059))

(declare-fun m!892061 () Bool)

(assert (=> start!82578 m!892061))

(declare-fun m!892063 () Bool)

(assert (=> b!962384 m!892063))

(assert (=> b!962384 m!892049))

(assert (=> b!962384 m!892063))

(assert (=> b!962384 m!892049))

(declare-fun m!892065 () Bool)

(assert (=> b!962384 m!892065))

(declare-fun m!892067 () Bool)

(assert (=> b!962392 m!892067))

(check-sat b_and!30199 (not start!82578) tp_is_empty!21513 (not b!962391) (not mapNonEmpty!34264) (not b!962384) (not b_next!18711) (not b!962392) (not b!962387))
(check-sat b_and!30199 (not b_next!18711))
