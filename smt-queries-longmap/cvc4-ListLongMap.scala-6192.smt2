; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79264 () Bool)

(assert start!79264)

(declare-fun b_free!17477 () Bool)

(declare-fun b_next!17477 () Bool)

(assert (=> start!79264 (= b_free!17477 (not b_next!17477))))

(declare-fun tp!60872 () Bool)

(declare-fun b_and!28543 () Bool)

(assert (=> start!79264 (= tp!60872 b_and!28543)))

(declare-fun b!930816 () Bool)

(declare-fun res!626869 () Bool)

(declare-fun e!522719 () Bool)

(assert (=> b!930816 (=> (not res!626869) (not e!522719))))

(declare-datatypes ((array!55910 0))(
  ( (array!55911 (arr!26900 (Array (_ BitVec 32) (_ BitVec 64))) (size!27359 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55910)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55910 (_ BitVec 32)) Bool)

(assert (=> b!930816 (= res!626869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!31734 () Bool)

(declare-fun mapRes!31734 () Bool)

(assert (=> mapIsEmpty!31734 mapRes!31734))

(declare-fun b!930817 () Bool)

(declare-fun res!626867 () Bool)

(assert (=> b!930817 (=> (not res!626867) (not e!522719))))

(declare-datatypes ((List!18935 0))(
  ( (Nil!18932) (Cons!18931 (h!20077 (_ BitVec 64)) (t!26992 List!18935)) )
))
(declare-fun arrayNoDuplicates!0 (array!55910 (_ BitVec 32) List!18935) Bool)

(assert (=> b!930817 (= res!626867 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18932))))

(declare-fun b!930818 () Bool)

(declare-fun e!522718 () Bool)

(declare-fun e!522717 () Bool)

(assert (=> b!930818 (= e!522718 (and e!522717 mapRes!31734))))

(declare-fun condMapEmpty!31734 () Bool)

(declare-datatypes ((V!31611 0))(
  ( (V!31612 (val!10043 Int)) )
))
(declare-datatypes ((ValueCell!9511 0))(
  ( (ValueCellFull!9511 (v!12561 V!31611)) (EmptyCell!9511) )
))
(declare-datatypes ((array!55912 0))(
  ( (array!55913 (arr!26901 (Array (_ BitVec 32) ValueCell!9511)) (size!27360 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55912)

(declare-fun mapDefault!31734 () ValueCell!9511)

