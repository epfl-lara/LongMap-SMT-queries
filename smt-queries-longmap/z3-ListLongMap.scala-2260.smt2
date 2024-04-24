; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37008 () Bool)

(assert start!37008)

(declare-fun b_free!8149 () Bool)

(declare-fun b_next!8149 () Bool)

(assert (=> start!37008 (= b_free!8149 (not b_next!8149))))

(declare-fun tp!29163 () Bool)

(declare-fun b_and!15405 () Bool)

(assert (=> start!37008 (= tp!29163 b_and!15405)))

(declare-fun b!371896 () Bool)

(declare-fun res!209185 () Bool)

(declare-fun e!226918 () Bool)

(assert (=> b!371896 (=> (not res!209185) (not e!226918))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12835 0))(
  ( (V!12836 (val!4443 Int)) )
))
(declare-datatypes ((ValueCell!4055 0))(
  ( (ValueCellFull!4055 (v!6641 V!12835)) (EmptyCell!4055) )
))
(declare-datatypes ((array!21518 0))(
  ( (array!21519 (arr!10227 (Array (_ BitVec 32) ValueCell!4055)) (size!10579 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21518)

(declare-datatypes ((array!21520 0))(
  ( (array!21521 (arr!10228 (Array (_ BitVec 32) (_ BitVec 64))) (size!10580 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21520)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!371896 (= res!209185 (and (= (size!10579 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10580 _keys!658) (size!10579 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!371897 () Bool)

(declare-fun res!209181 () Bool)

(assert (=> b!371897 (=> (not res!209181) (not e!226918))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!371897 (= res!209181 (validKeyInArray!0 k0!778))))

(declare-fun res!209183 () Bool)

(assert (=> start!37008 (=> (not res!209183) (not e!226918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37008 (= res!209183 (validMask!0 mask!970))))

(assert (=> start!37008 e!226918))

(declare-fun e!226921 () Bool)

(declare-fun array_inv!7580 (array!21518) Bool)

(assert (=> start!37008 (and (array_inv!7580 _values!506) e!226921)))

(assert (=> start!37008 tp!29163))

(assert (=> start!37008 true))

(declare-fun tp_is_empty!8797 () Bool)

(assert (=> start!37008 tp_is_empty!8797))

(declare-fun array_inv!7581 (array!21520) Bool)

(assert (=> start!37008 (array_inv!7581 _keys!658)))

(declare-fun b!371898 () Bool)

(declare-fun e!226922 () Bool)

(assert (=> b!371898 (= e!226918 e!226922)))

(declare-fun res!209186 () Bool)

(assert (=> b!371898 (=> (not res!209186) (not e!226922))))

(declare-fun lt!170504 () array!21520)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21520 (_ BitVec 32)) Bool)

(assert (=> b!371898 (= res!209186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170504 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!371898 (= lt!170504 (array!21521 (store (arr!10228 _keys!658) i!548 k0!778) (size!10580 _keys!658)))))

(declare-fun b!371899 () Bool)

(declare-fun res!209177 () Bool)

(assert (=> b!371899 (=> (not res!209177) (not e!226918))))

(assert (=> b!371899 (= res!209177 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10580 _keys!658))))))

(declare-fun b!371900 () Bool)

(declare-fun res!209178 () Bool)

(assert (=> b!371900 (=> (not res!209178) (not e!226918))))

(assert (=> b!371900 (= res!209178 (or (= (select (arr!10228 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10228 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!371901 () Bool)

(declare-fun e!226920 () Bool)

(assert (=> b!371901 (= e!226920 tp_is_empty!8797)))

(declare-fun b!371902 () Bool)

(declare-fun res!209180 () Bool)

(assert (=> b!371902 (=> (not res!209180) (not e!226922))))

(declare-datatypes ((List!5634 0))(
  ( (Nil!5631) (Cons!5630 (h!6486 (_ BitVec 64)) (t!10776 List!5634)) )
))
(declare-fun arrayNoDuplicates!0 (array!21520 (_ BitVec 32) List!5634) Bool)

(assert (=> b!371902 (= res!209180 (arrayNoDuplicates!0 lt!170504 #b00000000000000000000000000000000 Nil!5631))))

(declare-fun b!371903 () Bool)

(declare-fun res!209179 () Bool)

(assert (=> b!371903 (=> (not res!209179) (not e!226918))))

(assert (=> b!371903 (= res!209179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!14760 () Bool)

(declare-fun mapRes!14760 () Bool)

(assert (=> mapIsEmpty!14760 mapRes!14760))

(declare-fun b!371904 () Bool)

(declare-fun res!209182 () Bool)

(assert (=> b!371904 (=> (not res!209182) (not e!226918))))

(declare-fun arrayContainsKey!0 (array!21520 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!371904 (= res!209182 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!371905 () Bool)

(declare-fun e!226919 () Bool)

(assert (=> b!371905 (= e!226921 (and e!226919 mapRes!14760))))

(declare-fun condMapEmpty!14760 () Bool)

(declare-fun mapDefault!14760 () ValueCell!4055)

(assert (=> b!371905 (= condMapEmpty!14760 (= (arr!10227 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4055)) mapDefault!14760)))))

(declare-fun mapNonEmpty!14760 () Bool)

(declare-fun tp!29162 () Bool)

(assert (=> mapNonEmpty!14760 (= mapRes!14760 (and tp!29162 e!226920))))

(declare-fun mapRest!14760 () (Array (_ BitVec 32) ValueCell!4055))

(declare-fun mapKey!14760 () (_ BitVec 32))

(declare-fun mapValue!14760 () ValueCell!4055)

(assert (=> mapNonEmpty!14760 (= (arr!10227 _values!506) (store mapRest!14760 mapKey!14760 mapValue!14760))))

(declare-fun b!371906 () Bool)

(declare-fun res!209184 () Bool)

(assert (=> b!371906 (=> (not res!209184) (not e!226918))))

(assert (=> b!371906 (= res!209184 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5631))))

(declare-fun b!371907 () Bool)

(assert (=> b!371907 (= e!226922 (not true))))

(declare-fun zeroValue!472 () V!12835)

(declare-fun lt!170509 () array!21518)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5794 0))(
  ( (tuple2!5795 (_1!2908 (_ BitVec 64)) (_2!2908 V!12835)) )
))
(declare-datatypes ((List!5635 0))(
  ( (Nil!5632) (Cons!5631 (h!6487 tuple2!5794) (t!10777 List!5635)) )
))
(declare-datatypes ((ListLongMap!4709 0))(
  ( (ListLongMap!4710 (toList!2370 List!5635)) )
))
(declare-fun lt!170508 () ListLongMap!4709)

(declare-fun minValue!472 () V!12835)

(declare-fun getCurrentListMap!1832 (array!21520 array!21518 (_ BitVec 32) (_ BitVec 32) V!12835 V!12835 (_ BitVec 32) Int) ListLongMap!4709)

(assert (=> b!371907 (= lt!170508 (getCurrentListMap!1832 lt!170504 lt!170509 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170503 () ListLongMap!4709)

(declare-fun lt!170506 () ListLongMap!4709)

(assert (=> b!371907 (and (= lt!170503 lt!170506) (= lt!170506 lt!170503))))

(declare-fun v!373 () V!12835)

(declare-fun lt!170507 () ListLongMap!4709)

(declare-fun +!766 (ListLongMap!4709 tuple2!5794) ListLongMap!4709)

(assert (=> b!371907 (= lt!170506 (+!766 lt!170507 (tuple2!5795 k0!778 v!373)))))

(declare-datatypes ((Unit!11423 0))(
  ( (Unit!11424) )
))
(declare-fun lt!170505 () Unit!11423)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!19 (array!21520 array!21518 (_ BitVec 32) (_ BitVec 32) V!12835 V!12835 (_ BitVec 32) (_ BitVec 64) V!12835 (_ BitVec 32) Int) Unit!11423)

(assert (=> b!371907 (= lt!170505 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!19 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!679 (array!21520 array!21518 (_ BitVec 32) (_ BitVec 32) V!12835 V!12835 (_ BitVec 32) Int) ListLongMap!4709)

(assert (=> b!371907 (= lt!170503 (getCurrentListMapNoExtraKeys!679 lt!170504 lt!170509 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!371907 (= lt!170509 (array!21519 (store (arr!10227 _values!506) i!548 (ValueCellFull!4055 v!373)) (size!10579 _values!506)))))

(assert (=> b!371907 (= lt!170507 (getCurrentListMapNoExtraKeys!679 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!371908 () Bool)

(assert (=> b!371908 (= e!226919 tp_is_empty!8797)))

(assert (= (and start!37008 res!209183) b!371896))

(assert (= (and b!371896 res!209185) b!371903))

(assert (= (and b!371903 res!209179) b!371906))

(assert (= (and b!371906 res!209184) b!371899))

(assert (= (and b!371899 res!209177) b!371897))

(assert (= (and b!371897 res!209181) b!371900))

(assert (= (and b!371900 res!209178) b!371904))

(assert (= (and b!371904 res!209182) b!371898))

(assert (= (and b!371898 res!209186) b!371902))

(assert (= (and b!371902 res!209180) b!371907))

(assert (= (and b!371905 condMapEmpty!14760) mapIsEmpty!14760))

(assert (= (and b!371905 (not condMapEmpty!14760)) mapNonEmpty!14760))

(get-info :version)

(assert (= (and mapNonEmpty!14760 ((_ is ValueCellFull!4055) mapValue!14760)) b!371901))

(assert (= (and b!371905 ((_ is ValueCellFull!4055) mapDefault!14760)) b!371908))

(assert (= start!37008 b!371905))

(declare-fun m!368081 () Bool)

(assert (=> b!371897 m!368081))

(declare-fun m!368083 () Bool)

(assert (=> b!371907 m!368083))

(declare-fun m!368085 () Bool)

(assert (=> b!371907 m!368085))

(declare-fun m!368087 () Bool)

(assert (=> b!371907 m!368087))

(declare-fun m!368089 () Bool)

(assert (=> b!371907 m!368089))

(declare-fun m!368091 () Bool)

(assert (=> b!371907 m!368091))

(declare-fun m!368093 () Bool)

(assert (=> b!371907 m!368093))

(declare-fun m!368095 () Bool)

(assert (=> start!37008 m!368095))

(declare-fun m!368097 () Bool)

(assert (=> start!37008 m!368097))

(declare-fun m!368099 () Bool)

(assert (=> start!37008 m!368099))

(declare-fun m!368101 () Bool)

(assert (=> b!371903 m!368101))

(declare-fun m!368103 () Bool)

(assert (=> mapNonEmpty!14760 m!368103))

(declare-fun m!368105 () Bool)

(assert (=> b!371904 m!368105))

(declare-fun m!368107 () Bool)

(assert (=> b!371906 m!368107))

(declare-fun m!368109 () Bool)

(assert (=> b!371902 m!368109))

(declare-fun m!368111 () Bool)

(assert (=> b!371898 m!368111))

(declare-fun m!368113 () Bool)

(assert (=> b!371898 m!368113))

(declare-fun m!368115 () Bool)

(assert (=> b!371900 m!368115))

(check-sat (not b!371907) (not b!371906) b_and!15405 tp_is_empty!8797 (not b!371902) (not b_next!8149) (not b!371898) (not mapNonEmpty!14760) (not b!371897) (not b!371904) (not b!371903) (not start!37008))
(check-sat b_and!15405 (not b_next!8149))
