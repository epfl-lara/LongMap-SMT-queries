; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79246 () Bool)

(assert start!79246)

(declare-fun b_free!17459 () Bool)

(declare-fun b_next!17459 () Bool)

(assert (=> start!79246 (= b_free!17459 (not b_next!17459))))

(declare-fun tp!60818 () Bool)

(declare-fun b_and!28525 () Bool)

(assert (=> start!79246 (= tp!60818 b_and!28525)))

(declare-fun b!930573 () Bool)

(declare-fun res!626704 () Bool)

(declare-fun e!522556 () Bool)

(assert (=> b!930573 (=> (not res!626704) (not e!522556))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55880 0))(
  ( (array!55881 (arr!26885 (Array (_ BitVec 32) (_ BitVec 64))) (size!27344 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55880)

(assert (=> b!930573 (= res!626704 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27344 _keys!1487))))))

(declare-fun res!626707 () Bool)

(assert (=> start!79246 (=> (not res!626707) (not e!522556))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79246 (= res!626707 (validMask!0 mask!1881))))

(assert (=> start!79246 e!522556))

(assert (=> start!79246 true))

(declare-datatypes ((V!31587 0))(
  ( (V!31588 (val!10034 Int)) )
))
(declare-datatypes ((ValueCell!9502 0))(
  ( (ValueCellFull!9502 (v!12552 V!31587)) (EmptyCell!9502) )
))
(declare-datatypes ((array!55882 0))(
  ( (array!55883 (arr!26886 (Array (_ BitVec 32) ValueCell!9502)) (size!27345 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55882)

(declare-fun e!522554 () Bool)

(declare-fun array_inv!20924 (array!55882) Bool)

(assert (=> start!79246 (and (array_inv!20924 _values!1231) e!522554)))

(assert (=> start!79246 tp!60818))

(declare-fun array_inv!20925 (array!55880) Bool)

(assert (=> start!79246 (array_inv!20925 _keys!1487)))

(declare-fun tp_is_empty!19967 () Bool)

(assert (=> start!79246 tp_is_empty!19967))

(declare-fun b!930574 () Bool)

(declare-fun e!522555 () Bool)

(assert (=> b!930574 (= e!522556 e!522555)))

(declare-fun res!626702 () Bool)

(assert (=> b!930574 (=> (not res!626702) (not e!522555))))

(declare-datatypes ((tuple2!13132 0))(
  ( (tuple2!13133 (_1!6577 (_ BitVec 64)) (_2!6577 V!31587)) )
))
(declare-datatypes ((List!18924 0))(
  ( (Nil!18921) (Cons!18920 (h!20066 tuple2!13132) (t!26981 List!18924)) )
))
(declare-datatypes ((ListLongMap!11829 0))(
  ( (ListLongMap!11830 (toList!5930 List!18924)) )
))
(declare-fun lt!419256 () ListLongMap!11829)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4980 (ListLongMap!11829 (_ BitVec 64)) Bool)

(assert (=> b!930574 (= res!626702 (contains!4980 lt!419256 k!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31587)

(declare-fun minValue!1173 () V!31587)

(declare-fun getCurrentListMap!3171 (array!55880 array!55882 (_ BitVec 32) (_ BitVec 32) V!31587 V!31587 (_ BitVec 32) Int) ListLongMap!11829)

(assert (=> b!930574 (= lt!419256 (getCurrentListMap!3171 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!930575 () Bool)

(assert (=> b!930575 (= e!522555 false)))

(declare-fun lt!419257 () V!31587)

(declare-fun apply!752 (ListLongMap!11829 (_ BitVec 64)) V!31587)

(assert (=> b!930575 (= lt!419257 (apply!752 lt!419256 k!1099))))

(declare-fun b!930576 () Bool)

(declare-fun e!522557 () Bool)

(declare-fun mapRes!31707 () Bool)

(assert (=> b!930576 (= e!522554 (and e!522557 mapRes!31707))))

(declare-fun condMapEmpty!31707 () Bool)

(declare-fun mapDefault!31707 () ValueCell!9502)

