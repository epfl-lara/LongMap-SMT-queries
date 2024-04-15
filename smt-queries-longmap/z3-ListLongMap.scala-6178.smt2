; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79158 () Bool)

(assert start!79158)

(declare-fun b_free!17389 () Bool)

(declare-fun b_next!17389 () Bool)

(assert (=> start!79158 (= b_free!17389 (not b_next!17389))))

(declare-fun tp!60609 () Bool)

(declare-fun b_and!28429 () Bool)

(assert (=> start!79158 (= tp!60609 b_and!28429)))

(declare-fun b!929195 () Bool)

(declare-fun e!521778 () Bool)

(declare-fun tp_is_empty!19897 () Bool)

(assert (=> b!929195 (= e!521778 tp_is_empty!19897)))

(declare-fun b!929196 () Bool)

(declare-fun res!625773 () Bool)

(declare-fun e!521780 () Bool)

(assert (=> b!929196 (=> (not res!625773) (not e!521780))))

(declare-datatypes ((array!55715 0))(
  ( (array!55716 (arr!26803 (Array (_ BitVec 32) (_ BitVec 64))) (size!27264 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55715)

(declare-datatypes ((List!18887 0))(
  ( (Nil!18884) (Cons!18883 (h!20029 (_ BitVec 64)) (t!26935 List!18887)) )
))
(declare-fun arrayNoDuplicates!0 (array!55715 (_ BitVec 32) List!18887) Bool)

(assert (=> b!929196 (= res!625773 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18884))))

(declare-fun b!929197 () Bool)

(declare-fun res!625771 () Bool)

(assert (=> b!929197 (=> (not res!625771) (not e!521780))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55715 (_ BitVec 32)) Bool)

(assert (=> b!929197 (= res!625771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!625768 () Bool)

(assert (=> start!79158 (=> (not res!625768) (not e!521780))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79158 (= res!625768 (validMask!0 mask!1881))))

(assert (=> start!79158 e!521780))

(assert (=> start!79158 true))

(assert (=> start!79158 tp_is_empty!19897))

(declare-datatypes ((V!31495 0))(
  ( (V!31496 (val!9999 Int)) )
))
(declare-datatypes ((ValueCell!9467 0))(
  ( (ValueCellFull!9467 (v!12516 V!31495)) (EmptyCell!9467) )
))
(declare-datatypes ((array!55717 0))(
  ( (array!55718 (arr!26804 (Array (_ BitVec 32) ValueCell!9467)) (size!27265 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55717)

(declare-fun e!521776 () Bool)

(declare-fun array_inv!20946 (array!55717) Bool)

(assert (=> start!79158 (and (array_inv!20946 _values!1231) e!521776)))

(assert (=> start!79158 tp!60609))

(declare-fun array_inv!20947 (array!55715) Bool)

(assert (=> start!79158 (array_inv!20947 _keys!1487)))

(declare-fun b!929198 () Bool)

(declare-fun res!625774 () Bool)

(assert (=> b!929198 (=> (not res!625774) (not e!521780))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!929198 (= res!625774 (and (= (size!27265 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27264 _keys!1487) (size!27265 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!929199 () Bool)

(declare-fun res!625770 () Bool)

(declare-fun e!521777 () Bool)

(assert (=> b!929199 (=> (not res!625770) (not e!521777))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!31495)

(declare-datatypes ((tuple2!13122 0))(
  ( (tuple2!13123 (_1!6572 (_ BitVec 64)) (_2!6572 V!31495)) )
))
(declare-datatypes ((List!18888 0))(
  ( (Nil!18885) (Cons!18884 (h!20030 tuple2!13122) (t!26936 List!18888)) )
))
(declare-datatypes ((ListLongMap!11809 0))(
  ( (ListLongMap!11810 (toList!5920 List!18888)) )
))
(declare-fun lt!418829 () ListLongMap!11809)

(declare-fun apply!725 (ListLongMap!11809 (_ BitVec 64)) V!31495)

(assert (=> b!929199 (= res!625770 (= (apply!725 lt!418829 k0!1099) v!791))))

(declare-fun b!929200 () Bool)

(assert (=> b!929200 (= e!521777 false)))

(declare-fun lt!418828 () Bool)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31495)

(declare-fun minValue!1173 () V!31495)

(declare-fun contains!4927 (ListLongMap!11809 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3101 (array!55715 array!55717 (_ BitVec 32) (_ BitVec 32) V!31495 V!31495 (_ BitVec 32) Int) ListLongMap!11809)

(assert (=> b!929200 (= lt!418828 (contains!4927 (getCurrentListMap!3101 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k0!1099))))

(declare-fun b!929201 () Bool)

(assert (=> b!929201 (= e!521780 e!521777)))

(declare-fun res!625769 () Bool)

(assert (=> b!929201 (=> (not res!625769) (not e!521777))))

(assert (=> b!929201 (= res!625769 (contains!4927 lt!418829 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!929201 (= lt!418829 (getCurrentListMap!3101 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!31602 () Bool)

(declare-fun mapRes!31602 () Bool)

(declare-fun tp!60608 () Bool)

(assert (=> mapNonEmpty!31602 (= mapRes!31602 (and tp!60608 e!521778))))

(declare-fun mapValue!31602 () ValueCell!9467)

(declare-fun mapKey!31602 () (_ BitVec 32))

(declare-fun mapRest!31602 () (Array (_ BitVec 32) ValueCell!9467))

(assert (=> mapNonEmpty!31602 (= (arr!26804 _values!1231) (store mapRest!31602 mapKey!31602 mapValue!31602))))

(declare-fun b!929202 () Bool)

(declare-fun res!625772 () Bool)

(assert (=> b!929202 (=> (not res!625772) (not e!521777))))

(assert (=> b!929202 (= res!625772 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun b!929203 () Bool)

(declare-fun e!521781 () Bool)

(assert (=> b!929203 (= e!521781 tp_is_empty!19897)))

(declare-fun b!929204 () Bool)

(assert (=> b!929204 (= e!521776 (and e!521781 mapRes!31602))))

(declare-fun condMapEmpty!31602 () Bool)

(declare-fun mapDefault!31602 () ValueCell!9467)

(assert (=> b!929204 (= condMapEmpty!31602 (= (arr!26804 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9467)) mapDefault!31602)))))

(declare-fun mapIsEmpty!31602 () Bool)

(assert (=> mapIsEmpty!31602 mapRes!31602))

(declare-fun b!929205 () Bool)

(declare-fun res!625775 () Bool)

(assert (=> b!929205 (=> (not res!625775) (not e!521780))))

(assert (=> b!929205 (= res!625775 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27264 _keys!1487))))))

(assert (= (and start!79158 res!625768) b!929198))

(assert (= (and b!929198 res!625774) b!929197))

(assert (= (and b!929197 res!625771) b!929196))

(assert (= (and b!929196 res!625773) b!929205))

(assert (= (and b!929205 res!625775) b!929201))

(assert (= (and b!929201 res!625769) b!929199))

(assert (= (and b!929199 res!625770) b!929202))

(assert (= (and b!929202 res!625772) b!929200))

(assert (= (and b!929204 condMapEmpty!31602) mapIsEmpty!31602))

(assert (= (and b!929204 (not condMapEmpty!31602)) mapNonEmpty!31602))

(get-info :version)

(assert (= (and mapNonEmpty!31602 ((_ is ValueCellFull!9467) mapValue!31602)) b!929195))

(assert (= (and b!929204 ((_ is ValueCellFull!9467) mapDefault!31602)) b!929203))

(assert (= start!79158 b!929204))

(declare-fun m!863239 () Bool)

(assert (=> b!929200 m!863239))

(assert (=> b!929200 m!863239))

(declare-fun m!863241 () Bool)

(assert (=> b!929200 m!863241))

(declare-fun m!863243 () Bool)

(assert (=> b!929196 m!863243))

(declare-fun m!863245 () Bool)

(assert (=> b!929201 m!863245))

(declare-fun m!863247 () Bool)

(assert (=> b!929201 m!863247))

(declare-fun m!863249 () Bool)

(assert (=> b!929199 m!863249))

(declare-fun m!863251 () Bool)

(assert (=> mapNonEmpty!31602 m!863251))

(declare-fun m!863253 () Bool)

(assert (=> b!929197 m!863253))

(declare-fun m!863255 () Bool)

(assert (=> start!79158 m!863255))

(declare-fun m!863257 () Bool)

(assert (=> start!79158 m!863257))

(declare-fun m!863259 () Bool)

(assert (=> start!79158 m!863259))

(check-sat (not start!79158) (not b!929196) (not b_next!17389) b_and!28429 (not b!929197) (not b!929199) (not mapNonEmpty!31602) (not b!929200) tp_is_empty!19897 (not b!929201))
(check-sat b_and!28429 (not b_next!17389))
