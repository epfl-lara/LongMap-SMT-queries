; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79134 () Bool)

(assert start!79134)

(declare-fun b_free!17365 () Bool)

(declare-fun b_next!17365 () Bool)

(assert (=> start!79134 (= b_free!17365 (not b_next!17365))))

(declare-fun tp!60537 () Bool)

(declare-fun b_and!28405 () Bool)

(assert (=> start!79134 (= tp!60537 b_and!28405)))

(declare-fun b!928840 () Bool)

(declare-fun res!625525 () Bool)

(declare-fun e!521561 () Bool)

(assert (=> b!928840 (=> (not res!625525) (not e!521561))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55673 0))(
  ( (array!55674 (arr!26782 (Array (_ BitVec 32) (_ BitVec 64))) (size!27243 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55673)

(assert (=> b!928840 (= res!625525 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27243 _keys!1487))))))

(declare-fun mapIsEmpty!31566 () Bool)

(declare-fun mapRes!31566 () Bool)

(assert (=> mapIsEmpty!31566 mapRes!31566))

(declare-fun b!928841 () Bool)

(declare-fun res!625522 () Bool)

(assert (=> b!928841 (=> (not res!625522) (not e!521561))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55673 (_ BitVec 32)) Bool)

(assert (=> b!928841 (= res!625522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!928842 () Bool)

(declare-fun e!521562 () Bool)

(declare-fun tp_is_empty!19873 () Bool)

(assert (=> b!928842 (= e!521562 tp_is_empty!19873)))

(declare-fun mapNonEmpty!31566 () Bool)

(declare-fun tp!60536 () Bool)

(assert (=> mapNonEmpty!31566 (= mapRes!31566 (and tp!60536 e!521562))))

(declare-datatypes ((V!31463 0))(
  ( (V!31464 (val!9987 Int)) )
))
(declare-datatypes ((ValueCell!9455 0))(
  ( (ValueCellFull!9455 (v!12504 V!31463)) (EmptyCell!9455) )
))
(declare-fun mapRest!31566 () (Array (_ BitVec 32) ValueCell!9455))

(declare-fun mapKey!31566 () (_ BitVec 32))

(declare-datatypes ((array!55675 0))(
  ( (array!55676 (arr!26783 (Array (_ BitVec 32) ValueCell!9455)) (size!27244 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55675)

(declare-fun mapValue!31566 () ValueCell!9455)

(assert (=> mapNonEmpty!31566 (= (arr!26783 _values!1231) (store mapRest!31566 mapKey!31566 mapValue!31566))))

(declare-fun b!928843 () Bool)

(declare-fun e!521563 () Bool)

(assert (=> b!928843 (= e!521563 false)))

(declare-fun lt!418765 () V!31463)

(declare-datatypes ((tuple2!13106 0))(
  ( (tuple2!13107 (_1!6564 (_ BitVec 64)) (_2!6564 V!31463)) )
))
(declare-datatypes ((List!18872 0))(
  ( (Nil!18869) (Cons!18868 (h!20014 tuple2!13106) (t!26920 List!18872)) )
))
(declare-datatypes ((ListLongMap!11793 0))(
  ( (ListLongMap!11794 (toList!5912 List!18872)) )
))
(declare-fun lt!418766 () ListLongMap!11793)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!720 (ListLongMap!11793 (_ BitVec 64)) V!31463)

(assert (=> b!928843 (= lt!418765 (apply!720 lt!418766 k0!1099))))

(declare-fun b!928844 () Bool)

(declare-fun res!625526 () Bool)

(assert (=> b!928844 (=> (not res!625526) (not e!521561))))

(declare-datatypes ((List!18873 0))(
  ( (Nil!18870) (Cons!18869 (h!20015 (_ BitVec 64)) (t!26921 List!18873)) )
))
(declare-fun arrayNoDuplicates!0 (array!55673 (_ BitVec 32) List!18873) Bool)

(assert (=> b!928844 (= res!625526 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18870))))

(declare-fun b!928845 () Bool)

(declare-fun e!521565 () Bool)

(assert (=> b!928845 (= e!521565 tp_is_empty!19873)))

(declare-fun res!625524 () Bool)

(assert (=> start!79134 (=> (not res!625524) (not e!521561))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79134 (= res!625524 (validMask!0 mask!1881))))

(assert (=> start!79134 e!521561))

(assert (=> start!79134 true))

(declare-fun e!521560 () Bool)

(declare-fun array_inv!20938 (array!55675) Bool)

(assert (=> start!79134 (and (array_inv!20938 _values!1231) e!521560)))

(assert (=> start!79134 tp!60537))

(declare-fun array_inv!20939 (array!55673) Bool)

(assert (=> start!79134 (array_inv!20939 _keys!1487)))

(assert (=> start!79134 tp_is_empty!19873))

(declare-fun b!928846 () Bool)

(declare-fun res!625523 () Bool)

(assert (=> b!928846 (=> (not res!625523) (not e!521561))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!928846 (= res!625523 (and (= (size!27244 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27243 _keys!1487) (size!27244 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!928847 () Bool)

(assert (=> b!928847 (= e!521561 e!521563)))

(declare-fun res!625521 () Bool)

(assert (=> b!928847 (=> (not res!625521) (not e!521563))))

(declare-fun contains!4920 (ListLongMap!11793 (_ BitVec 64)) Bool)

(assert (=> b!928847 (= res!625521 (contains!4920 lt!418766 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31463)

(declare-fun minValue!1173 () V!31463)

(declare-fun getCurrentListMap!3094 (array!55673 array!55675 (_ BitVec 32) (_ BitVec 32) V!31463 V!31463 (_ BitVec 32) Int) ListLongMap!11793)

(assert (=> b!928847 (= lt!418766 (getCurrentListMap!3094 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!928848 () Bool)

(assert (=> b!928848 (= e!521560 (and e!521565 mapRes!31566))))

(declare-fun condMapEmpty!31566 () Bool)

(declare-fun mapDefault!31566 () ValueCell!9455)

(assert (=> b!928848 (= condMapEmpty!31566 (= (arr!26783 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9455)) mapDefault!31566)))))

(assert (= (and start!79134 res!625524) b!928846))

(assert (= (and b!928846 res!625523) b!928841))

(assert (= (and b!928841 res!625522) b!928844))

(assert (= (and b!928844 res!625526) b!928840))

(assert (= (and b!928840 res!625525) b!928847))

(assert (= (and b!928847 res!625521) b!928843))

(assert (= (and b!928848 condMapEmpty!31566) mapIsEmpty!31566))

(assert (= (and b!928848 (not condMapEmpty!31566)) mapNonEmpty!31566))

(get-info :version)

(assert (= (and mapNonEmpty!31566 ((_ is ValueCellFull!9455) mapValue!31566)) b!928842))

(assert (= (and b!928848 ((_ is ValueCellFull!9455) mapDefault!31566)) b!928845))

(assert (= start!79134 b!928848))

(declare-fun m!863011 () Bool)

(assert (=> mapNonEmpty!31566 m!863011))

(declare-fun m!863013 () Bool)

(assert (=> b!928847 m!863013))

(declare-fun m!863015 () Bool)

(assert (=> b!928847 m!863015))

(declare-fun m!863017 () Bool)

(assert (=> b!928844 m!863017))

(declare-fun m!863019 () Bool)

(assert (=> start!79134 m!863019))

(declare-fun m!863021 () Bool)

(assert (=> start!79134 m!863021))

(declare-fun m!863023 () Bool)

(assert (=> start!79134 m!863023))

(declare-fun m!863025 () Bool)

(assert (=> b!928841 m!863025))

(declare-fun m!863027 () Bool)

(assert (=> b!928843 m!863027))

(check-sat (not b_next!17365) (not b!928847) (not start!79134) tp_is_empty!19873 (not b!928844) (not b!928843) b_and!28405 (not b!928841) (not mapNonEmpty!31566))
(check-sat b_and!28405 (not b_next!17365))
