; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79266 () Bool)

(assert start!79266)

(declare-fun b_free!17479 () Bool)

(declare-fun b_next!17479 () Bool)

(assert (=> start!79266 (= b_free!17479 (not b_next!17479))))

(declare-fun tp!60878 () Bool)

(declare-fun b_and!28545 () Bool)

(assert (=> start!79266 (= tp!60878 b_and!28545)))

(declare-fun b!930843 () Bool)

(declare-fun res!626886 () Bool)

(declare-fun e!522736 () Bool)

(assert (=> b!930843 (=> (not res!626886) (not e!522736))))

(declare-datatypes ((array!55914 0))(
  ( (array!55915 (arr!26902 (Array (_ BitVec 32) (_ BitVec 64))) (size!27361 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55914)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31615 0))(
  ( (V!31616 (val!10044 Int)) )
))
(declare-datatypes ((ValueCell!9512 0))(
  ( (ValueCellFull!9512 (v!12562 V!31615)) (EmptyCell!9512) )
))
(declare-datatypes ((array!55916 0))(
  ( (array!55917 (arr!26903 (Array (_ BitVec 32) ValueCell!9512)) (size!27362 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55916)

(assert (=> b!930843 (= res!626886 (and (= (size!27362 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27361 _keys!1487) (size!27362 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!930844 () Bool)

(declare-fun res!626884 () Bool)

(assert (=> b!930844 (=> (not res!626884) (not e!522736))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55914 (_ BitVec 32)) Bool)

(assert (=> b!930844 (= res!626884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!626883 () Bool)

(assert (=> start!79266 (=> (not res!626883) (not e!522736))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79266 (= res!626883 (validMask!0 mask!1881))))

(assert (=> start!79266 e!522736))

(assert (=> start!79266 true))

(declare-fun e!522734 () Bool)

(declare-fun array_inv!20936 (array!55916) Bool)

(assert (=> start!79266 (and (array_inv!20936 _values!1231) e!522734)))

(assert (=> start!79266 tp!60878))

(declare-fun array_inv!20937 (array!55914) Bool)

(assert (=> start!79266 (array_inv!20937 _keys!1487)))

(declare-fun tp_is_empty!19987 () Bool)

(assert (=> start!79266 tp_is_empty!19987))

(declare-fun b!930845 () Bool)

(declare-fun e!522737 () Bool)

(assert (=> b!930845 (= e!522737 tp_is_empty!19987)))

(declare-fun mapNonEmpty!31737 () Bool)

(declare-fun mapRes!31737 () Bool)

(declare-fun tp!60877 () Bool)

(assert (=> mapNonEmpty!31737 (= mapRes!31737 (and tp!60877 e!522737))))

(declare-fun mapKey!31737 () (_ BitVec 32))

(declare-fun mapValue!31737 () ValueCell!9512)

(declare-fun mapRest!31737 () (Array (_ BitVec 32) ValueCell!9512))

(assert (=> mapNonEmpty!31737 (= (arr!26903 _values!1231) (store mapRest!31737 mapKey!31737 mapValue!31737))))

(declare-fun b!930846 () Bool)

(declare-fun res!626882 () Bool)

(assert (=> b!930846 (=> (not res!626882) (not e!522736))))

(declare-datatypes ((List!18936 0))(
  ( (Nil!18933) (Cons!18932 (h!20078 (_ BitVec 64)) (t!26993 List!18936)) )
))
(declare-fun arrayNoDuplicates!0 (array!55914 (_ BitVec 32) List!18936) Bool)

(assert (=> b!930846 (= res!626882 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18933))))

(declare-fun b!930847 () Bool)

(declare-fun res!626887 () Bool)

(assert (=> b!930847 (=> (not res!626887) (not e!522736))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!930847 (= res!626887 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27361 _keys!1487))))))

(declare-fun b!930848 () Bool)

(declare-fun e!522735 () Bool)

(assert (=> b!930848 (= e!522735 false)))

(declare-fun lt!419316 () V!31615)

(declare-datatypes ((tuple2!13146 0))(
  ( (tuple2!13147 (_1!6584 (_ BitVec 64)) (_2!6584 V!31615)) )
))
(declare-datatypes ((List!18937 0))(
  ( (Nil!18934) (Cons!18933 (h!20079 tuple2!13146) (t!26994 List!18937)) )
))
(declare-datatypes ((ListLongMap!11843 0))(
  ( (ListLongMap!11844 (toList!5937 List!18937)) )
))
(declare-fun lt!419317 () ListLongMap!11843)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun apply!759 (ListLongMap!11843 (_ BitVec 64)) V!31615)

(assert (=> b!930848 (= lt!419316 (apply!759 lt!419317 k!1099))))

(declare-fun b!930849 () Bool)

(declare-fun e!522738 () Bool)

(assert (=> b!930849 (= e!522738 tp_is_empty!19987)))

(declare-fun mapIsEmpty!31737 () Bool)

(assert (=> mapIsEmpty!31737 mapRes!31737))

(declare-fun b!930850 () Bool)

(assert (=> b!930850 (= e!522736 e!522735)))

(declare-fun res!626885 () Bool)

(assert (=> b!930850 (=> (not res!626885) (not e!522735))))

(declare-fun contains!4985 (ListLongMap!11843 (_ BitVec 64)) Bool)

(assert (=> b!930850 (= res!626885 (contains!4985 lt!419317 k!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31615)

(declare-fun minValue!1173 () V!31615)

(declare-fun getCurrentListMap!3176 (array!55914 array!55916 (_ BitVec 32) (_ BitVec 32) V!31615 V!31615 (_ BitVec 32) Int) ListLongMap!11843)

(assert (=> b!930850 (= lt!419317 (getCurrentListMap!3176 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!930851 () Bool)

(assert (=> b!930851 (= e!522734 (and e!522738 mapRes!31737))))

(declare-fun condMapEmpty!31737 () Bool)

(declare-fun mapDefault!31737 () ValueCell!9512)

