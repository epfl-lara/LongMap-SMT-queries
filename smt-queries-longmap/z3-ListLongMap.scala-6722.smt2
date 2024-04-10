; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84306 () Bool)

(assert start!84306)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun lt!437459 () Bool)

(declare-fun e!556029 () Bool)

(declare-datatypes ((array!62185 0))(
  ( (array!62186 (arr!29950 (Array (_ BitVec 32) (_ BitVec 64))) (size!30429 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62185)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun b!986242 () Bool)

(assert (=> b!986242 (= e!556029 (and (or lt!437459 (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (or lt!437459 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (or (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not lt!437459)) (bvsgt from!1932 (size!30429 _keys!1544))))))

(assert (=> b!986242 (= lt!437459 (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!986243 () Bool)

(declare-fun res!659886 () Bool)

(assert (=> b!986243 (=> (not res!659886) (not e!556029))))

(declare-datatypes ((List!20734 0))(
  ( (Nil!20731) (Cons!20730 (h!21892 (_ BitVec 64)) (t!29633 List!20734)) )
))
(declare-fun arrayNoDuplicates!0 (array!62185 (_ BitVec 32) List!20734) Bool)

(assert (=> b!986243 (= res!659886 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20731))))

(declare-fun b!986244 () Bool)

(declare-fun res!659888 () Bool)

(assert (=> b!986244 (=> (not res!659888) (not e!556029))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35795 0))(
  ( (V!35796 (val!11605 Int)) )
))
(declare-datatypes ((ValueCell!11073 0))(
  ( (ValueCellFull!11073 (v!14167 V!35795)) (EmptyCell!11073) )
))
(declare-datatypes ((array!62187 0))(
  ( (array!62188 (arr!29951 (Array (_ BitVec 32) ValueCell!11073)) (size!30430 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62187)

(assert (=> b!986244 (= res!659888 (and (= (size!30430 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30429 _keys!1544) (size!30430 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!986245 () Bool)

(declare-fun res!659890 () Bool)

(assert (=> b!986245 (=> (not res!659890) (not e!556029))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62185 (_ BitVec 32)) Bool)

(assert (=> b!986245 (= res!659890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!986246 () Bool)

(declare-fun e!556031 () Bool)

(declare-fun tp_is_empty!23109 () Bool)

(assert (=> b!986246 (= e!556031 tp_is_empty!23109)))

(declare-fun res!659887 () Bool)

(assert (=> start!84306 (=> (not res!659887) (not e!556029))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84306 (= res!659887 (validMask!0 mask!1948))))

(assert (=> start!84306 e!556029))

(assert (=> start!84306 true))

(declare-fun e!556028 () Bool)

(declare-fun array_inv!23147 (array!62187) Bool)

(assert (=> start!84306 (and (array_inv!23147 _values!1278) e!556028)))

(declare-fun array_inv!23148 (array!62185) Bool)

(assert (=> start!84306 (array_inv!23148 _keys!1544)))

(declare-fun mapIsEmpty!36692 () Bool)

(declare-fun mapRes!36692 () Bool)

(assert (=> mapIsEmpty!36692 mapRes!36692))

(declare-fun mapNonEmpty!36692 () Bool)

(declare-fun tp!69547 () Bool)

(assert (=> mapNonEmpty!36692 (= mapRes!36692 (and tp!69547 e!556031))))

(declare-fun mapValue!36692 () ValueCell!11073)

(declare-fun mapRest!36692 () (Array (_ BitVec 32) ValueCell!11073))

(declare-fun mapKey!36692 () (_ BitVec 32))

(assert (=> mapNonEmpty!36692 (= (arr!29951 _values!1278) (store mapRest!36692 mapKey!36692 mapValue!36692))))

(declare-fun b!986247 () Bool)

(declare-fun res!659889 () Bool)

(assert (=> b!986247 (=> (not res!659889) (not e!556029))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!986247 (= res!659889 (validKeyInArray!0 (select (arr!29950 _keys!1544) from!1932)))))

(declare-fun b!986248 () Bool)

(declare-fun res!659891 () Bool)

(assert (=> b!986248 (=> (not res!659891) (not e!556029))))

(assert (=> b!986248 (= res!659891 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30429 _keys!1544))))))

(declare-fun b!986249 () Bool)

(declare-fun e!556030 () Bool)

(assert (=> b!986249 (= e!556030 tp_is_empty!23109)))

(declare-fun b!986250 () Bool)

(assert (=> b!986250 (= e!556028 (and e!556030 mapRes!36692))))

(declare-fun condMapEmpty!36692 () Bool)

(declare-fun mapDefault!36692 () ValueCell!11073)

(assert (=> b!986250 (= condMapEmpty!36692 (= (arr!29951 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11073)) mapDefault!36692)))))

(assert (= (and start!84306 res!659887) b!986244))

(assert (= (and b!986244 res!659888) b!986245))

(assert (= (and b!986245 res!659890) b!986243))

(assert (= (and b!986243 res!659886) b!986248))

(assert (= (and b!986248 res!659891) b!986247))

(assert (= (and b!986247 res!659889) b!986242))

(assert (= (and b!986250 condMapEmpty!36692) mapIsEmpty!36692))

(assert (= (and b!986250 (not condMapEmpty!36692)) mapNonEmpty!36692))

(get-info :version)

(assert (= (and mapNonEmpty!36692 ((_ is ValueCellFull!11073) mapValue!36692)) b!986246))

(assert (= (and b!986250 ((_ is ValueCellFull!11073) mapDefault!36692)) b!986249))

(assert (= start!84306 b!986250))

(declare-fun m!913139 () Bool)

(assert (=> start!84306 m!913139))

(declare-fun m!913141 () Bool)

(assert (=> start!84306 m!913141))

(declare-fun m!913143 () Bool)

(assert (=> start!84306 m!913143))

(declare-fun m!913145 () Bool)

(assert (=> mapNonEmpty!36692 m!913145))

(declare-fun m!913147 () Bool)

(assert (=> b!986245 m!913147))

(declare-fun m!913149 () Bool)

(assert (=> b!986247 m!913149))

(assert (=> b!986247 m!913149))

(declare-fun m!913151 () Bool)

(assert (=> b!986247 m!913151))

(declare-fun m!913153 () Bool)

(assert (=> b!986243 m!913153))

(check-sat (not mapNonEmpty!36692) (not b!986247) tp_is_empty!23109 (not start!84306) (not b!986243) (not b!986245))
(check-sat)
