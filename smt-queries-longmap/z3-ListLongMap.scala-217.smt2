; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3974 () Bool)

(assert start!3974)

(declare-fun b_free!889 () Bool)

(declare-fun b_next!889 () Bool)

(assert (=> start!3974 (= b_free!889 (not b_next!889))))

(declare-fun tp!4086 () Bool)

(declare-fun b_and!1693 () Bool)

(assert (=> start!3974 (= tp!4086 b_and!1693)))

(declare-fun b!28700 () Bool)

(declare-fun e!18553 () Bool)

(declare-fun e!18549 () Bool)

(declare-fun mapRes!1393 () Bool)

(assert (=> b!28700 (= e!18553 (and e!18549 mapRes!1393))))

(declare-fun condMapEmpty!1393 () Bool)

(declare-datatypes ((V!1483 0))(
  ( (V!1484 (val!648 Int)) )
))
(declare-datatypes ((ValueCell!422 0))(
  ( (ValueCellFull!422 (v!1736 V!1483)) (EmptyCell!422) )
))
(declare-datatypes ((array!1699 0))(
  ( (array!1700 (arr!803 (Array (_ BitVec 32) ValueCell!422)) (size!904 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1699)

(declare-fun mapDefault!1393 () ValueCell!422)

(assert (=> b!28700 (= condMapEmpty!1393 (= (arr!803 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!422)) mapDefault!1393)))))

(declare-fun b!28701 () Bool)

(declare-fun e!18551 () Bool)

(declare-fun tp_is_empty!1243 () Bool)

(assert (=> b!28701 (= e!18551 tp_is_empty!1243)))

(declare-fun b!28702 () Bool)

(declare-fun e!18552 () Bool)

(declare-fun e!18550 () Bool)

(assert (=> b!28702 (= e!18552 (not e!18550))))

(declare-fun res!17143 () Bool)

(assert (=> b!28702 (=> res!17143 e!18550)))

(declare-datatypes ((array!1701 0))(
  ( (array!1702 (arr!804 (Array (_ BitVec 32) (_ BitVec 64))) (size!905 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1701)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!28702 (= res!17143 (not (= (size!905 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(declare-datatypes ((tuple2!1090 0))(
  ( (tuple2!1091 (_1!556 (_ BitVec 64)) (_2!556 V!1483)) )
))
(declare-datatypes ((List!673 0))(
  ( (Nil!670) (Cons!669 (h!1236 tuple2!1090) (t!3359 List!673)) )
))
(declare-datatypes ((ListLongMap!655 0))(
  ( (ListLongMap!656 (toList!343 List!673)) )
))
(declare-fun lt!10921 () ListLongMap!655)

(declare-fun lt!10919 () (_ BitVec 32))

(declare-fun contains!284 (ListLongMap!655 (_ BitVec 64)) Bool)

(assert (=> b!28702 (contains!284 lt!10921 (select (arr!804 _keys!1833) lt!10919))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1483)

(declare-fun minValue!1443 () V!1483)

(declare-datatypes ((Unit!660 0))(
  ( (Unit!661) )
))
(declare-fun lt!10920 () Unit!660)

(declare-fun lemmaValidKeyInArrayIsInListMap!20 (array!1701 array!1699 (_ BitVec 32) (_ BitVec 32) V!1483 V!1483 (_ BitVec 32) Int) Unit!660)

(assert (=> b!28702 (= lt!10920 (lemmaValidKeyInArrayIsInListMap!20 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!10919 defaultEntry!1504))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!1701 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28702 (= lt!10919 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28703 () Bool)

(declare-fun res!17146 () Bool)

(declare-fun e!18548 () Bool)

(assert (=> b!28703 (=> (not res!17146) (not e!18548))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1701 (_ BitVec 32)) Bool)

(assert (=> b!28703 (= res!17146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!28704 () Bool)

(declare-fun res!17144 () Bool)

(assert (=> b!28704 (=> (not res!17144) (not e!18548))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28704 (= res!17144 (validKeyInArray!0 k0!1304))))

(declare-fun b!28705 () Bool)

(declare-fun res!17142 () Bool)

(assert (=> b!28705 (=> (not res!17142) (not e!18552))))

(declare-fun arrayContainsKey!0 (array!1701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28705 (= res!17142 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun res!17139 () Bool)

(assert (=> start!3974 (=> (not res!17139) (not e!18548))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3974 (= res!17139 (validMask!0 mask!2294))))

(assert (=> start!3974 e!18548))

(assert (=> start!3974 true))

(assert (=> start!3974 tp!4086))

(declare-fun array_inv!561 (array!1699) Bool)

(assert (=> start!3974 (and (array_inv!561 _values!1501) e!18553)))

(declare-fun array_inv!562 (array!1701) Bool)

(assert (=> start!3974 (array_inv!562 _keys!1833)))

(assert (=> start!3974 tp_is_empty!1243))

(declare-fun mapIsEmpty!1393 () Bool)

(assert (=> mapIsEmpty!1393 mapRes!1393))

(declare-fun b!28706 () Bool)

(declare-fun res!17145 () Bool)

(assert (=> b!28706 (=> (not res!17145) (not e!18548))))

(declare-datatypes ((List!674 0))(
  ( (Nil!671) (Cons!670 (h!1237 (_ BitVec 64)) (t!3360 List!674)) )
))
(declare-fun arrayNoDuplicates!0 (array!1701 (_ BitVec 32) List!674) Bool)

(assert (=> b!28706 (= res!17145 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!671))))

(declare-fun mapNonEmpty!1393 () Bool)

(declare-fun tp!4087 () Bool)

(assert (=> mapNonEmpty!1393 (= mapRes!1393 (and tp!4087 e!18551))))

(declare-fun mapRest!1393 () (Array (_ BitVec 32) ValueCell!422))

(declare-fun mapValue!1393 () ValueCell!422)

(declare-fun mapKey!1393 () (_ BitVec 32))

(assert (=> mapNonEmpty!1393 (= (arr!803 _values!1501) (store mapRest!1393 mapKey!1393 mapValue!1393))))

(declare-fun b!28707 () Bool)

(assert (=> b!28707 (= e!18548 e!18552)))

(declare-fun res!17140 () Bool)

(assert (=> b!28707 (=> (not res!17140) (not e!18552))))

(assert (=> b!28707 (= res!17140 (not (contains!284 lt!10921 k0!1304)))))

(declare-fun getCurrentListMap!171 (array!1701 array!1699 (_ BitVec 32) (_ BitVec 32) V!1483 V!1483 (_ BitVec 32) Int) ListLongMap!655)

(assert (=> b!28707 (= lt!10921 (getCurrentListMap!171 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!28708 () Bool)

(assert (=> b!28708 (= e!18550 true)))

(declare-datatypes ((SeekEntryResult!75 0))(
  ( (MissingZero!75 (index!2422 (_ BitVec 32))) (Found!75 (index!2423 (_ BitVec 32))) (Intermediate!75 (undefined!887 Bool) (index!2424 (_ BitVec 32)) (x!6353 (_ BitVec 32))) (Undefined!75) (MissingVacant!75 (index!2425 (_ BitVec 32))) )
))
(declare-fun lt!10918 () SeekEntryResult!75)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1701 (_ BitVec 32)) SeekEntryResult!75)

(assert (=> b!28708 (= lt!10918 (seekEntryOrOpen!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!28709 () Bool)

(assert (=> b!28709 (= e!18549 tp_is_empty!1243)))

(declare-fun b!28710 () Bool)

(declare-fun res!17141 () Bool)

(assert (=> b!28710 (=> (not res!17141) (not e!18548))))

(assert (=> b!28710 (= res!17141 (and (= (size!904 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!905 _keys!1833) (size!904 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(assert (= (and start!3974 res!17139) b!28710))

(assert (= (and b!28710 res!17141) b!28703))

(assert (= (and b!28703 res!17146) b!28706))

(assert (= (and b!28706 res!17145) b!28704))

(assert (= (and b!28704 res!17144) b!28707))

(assert (= (and b!28707 res!17140) b!28705))

(assert (= (and b!28705 res!17142) b!28702))

(assert (= (and b!28702 (not res!17143)) b!28708))

(assert (= (and b!28700 condMapEmpty!1393) mapIsEmpty!1393))

(assert (= (and b!28700 (not condMapEmpty!1393)) mapNonEmpty!1393))

(get-info :version)

(assert (= (and mapNonEmpty!1393 ((_ is ValueCellFull!422) mapValue!1393)) b!28701))

(assert (= (and b!28700 ((_ is ValueCellFull!422) mapDefault!1393)) b!28709))

(assert (= start!3974 b!28700))

(declare-fun m!22857 () Bool)

(assert (=> start!3974 m!22857))

(declare-fun m!22859 () Bool)

(assert (=> start!3974 m!22859))

(declare-fun m!22861 () Bool)

(assert (=> start!3974 m!22861))

(declare-fun m!22863 () Bool)

(assert (=> b!28707 m!22863))

(declare-fun m!22865 () Bool)

(assert (=> b!28707 m!22865))

(declare-fun m!22867 () Bool)

(assert (=> b!28708 m!22867))

(declare-fun m!22869 () Bool)

(assert (=> b!28705 m!22869))

(declare-fun m!22871 () Bool)

(assert (=> b!28703 m!22871))

(declare-fun m!22873 () Bool)

(assert (=> b!28704 m!22873))

(declare-fun m!22875 () Bool)

(assert (=> b!28706 m!22875))

(declare-fun m!22877 () Bool)

(assert (=> mapNonEmpty!1393 m!22877))

(declare-fun m!22879 () Bool)

(assert (=> b!28702 m!22879))

(assert (=> b!28702 m!22879))

(declare-fun m!22881 () Bool)

(assert (=> b!28702 m!22881))

(declare-fun m!22883 () Bool)

(assert (=> b!28702 m!22883))

(declare-fun m!22885 () Bool)

(assert (=> b!28702 m!22885))

(check-sat (not mapNonEmpty!1393) (not start!3974) (not b!28706) (not b_next!889) (not b!28708) (not b!28703) (not b!28702) (not b!28705) b_and!1693 (not b!28704) tp_is_empty!1243 (not b!28707))
(check-sat b_and!1693 (not b_next!889))
