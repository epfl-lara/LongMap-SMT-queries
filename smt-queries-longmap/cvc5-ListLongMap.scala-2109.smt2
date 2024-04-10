; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35822 () Bool)

(assert start!35822)

(declare-fun b!359886 () Bool)

(declare-fun res!200057 () Bool)

(declare-fun e!220441 () Bool)

(assert (=> b!359886 (=> (not res!200057) (not e!220441))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((V!12011 0))(
  ( (V!12012 (val!4182 Int)) )
))
(declare-datatypes ((ValueCell!3794 0))(
  ( (ValueCellFull!3794 (v!6376 V!12011)) (EmptyCell!3794) )
))
(declare-datatypes ((array!20103 0))(
  ( (array!20104 (arr!9545 (Array (_ BitVec 32) ValueCell!3794)) (size!9897 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20103)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-datatypes ((array!20105 0))(
  ( (array!20106 (arr!9546 (Array (_ BitVec 32) (_ BitVec 64))) (size!9898 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20105)

(assert (=> b!359886 (= res!200057 (and (= (size!9897 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9898 _keys!1456) (size!9897 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!359887 () Bool)

(declare-fun res!200059 () Bool)

(assert (=> b!359887 (=> (not res!200059) (not e!220441))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!20105 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!359887 (= res!200059 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun res!200056 () Bool)

(assert (=> start!35822 (=> (not res!200056) (not e!220441))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35822 (= res!200056 (validMask!0 mask!1842))))

(assert (=> start!35822 e!220441))

(declare-fun tp_is_empty!8275 () Bool)

(assert (=> start!35822 tp_is_empty!8275))

(assert (=> start!35822 true))

(declare-fun array_inv!7022 (array!20105) Bool)

(assert (=> start!35822 (array_inv!7022 _keys!1456)))

(declare-fun e!220439 () Bool)

(declare-fun array_inv!7023 (array!20103) Bool)

(assert (=> start!35822 (and (array_inv!7023 _values!1208) e!220439)))

(declare-fun b!359888 () Bool)

(declare-fun res!200052 () Bool)

(assert (=> b!359888 (=> (not res!200052) (not e!220441))))

(assert (=> b!359888 (= res!200052 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9898 _keys!1456))))))

(declare-fun b!359889 () Bool)

(declare-fun res!200054 () Bool)

(assert (=> b!359889 (=> (not res!200054) (not e!220441))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!359889 (= res!200054 (validKeyInArray!0 k!1077))))

(declare-fun b!359890 () Bool)

(declare-fun res!200055 () Bool)

(assert (=> b!359890 (=> (not res!200055) (not e!220441))))

(assert (=> b!359890 (= res!200055 (not (= (select (arr!9546 _keys!1456) from!1805) k!1077)))))

(declare-fun b!359891 () Bool)

(declare-fun e!220438 () Bool)

(declare-fun mapRes!13920 () Bool)

(assert (=> b!359891 (= e!220439 (and e!220438 mapRes!13920))))

(declare-fun condMapEmpty!13920 () Bool)

(declare-fun mapDefault!13920 () ValueCell!3794)

