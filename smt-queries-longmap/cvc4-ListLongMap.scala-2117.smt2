; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35890 () Bool)

(assert start!35890)

(declare-fun b!360787 () Bool)

(declare-fun res!200699 () Bool)

(declare-fun e!220866 () Bool)

(assert (=> b!360787 (=> (not res!200699) (not e!220866))))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360787 (= res!200699 (validKeyInArray!0 k!1077))))

(declare-fun b!360788 () Bool)

(declare-fun e!220867 () Bool)

(declare-fun tp_is_empty!8327 () Bool)

(assert (=> b!360788 (= e!220867 tp_is_empty!8327)))

(declare-fun b!360789 () Bool)

(declare-fun res!200702 () Bool)

(assert (=> b!360789 (=> (not res!200702) (not e!220866))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((array!20207 0))(
  ( (array!20208 (arr!9596 (Array (_ BitVec 32) (_ BitVec 64))) (size!9948 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20207)

(assert (=> b!360789 (= res!200702 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9948 _keys!1456))))))

(declare-fun mapNonEmpty!14001 () Bool)

(declare-fun mapRes!14001 () Bool)

(declare-fun tp!28068 () Bool)

(assert (=> mapNonEmpty!14001 (= mapRes!14001 (and tp!28068 e!220867))))

(declare-datatypes ((V!12079 0))(
  ( (V!12080 (val!4208 Int)) )
))
(declare-datatypes ((ValueCell!3820 0))(
  ( (ValueCellFull!3820 (v!6402 V!12079)) (EmptyCell!3820) )
))
(declare-fun mapValue!14001 () ValueCell!3820)

(declare-fun mapKey!14001 () (_ BitVec 32))

(declare-fun mapRest!14001 () (Array (_ BitVec 32) ValueCell!3820))

(declare-datatypes ((array!20209 0))(
  ( (array!20210 (arr!9597 (Array (_ BitVec 32) ValueCell!3820)) (size!9949 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20209)

(assert (=> mapNonEmpty!14001 (= (arr!9597 _values!1208) (store mapRest!14001 mapKey!14001 mapValue!14001))))

(declare-fun res!200704 () Bool)

(assert (=> start!35890 (=> (not res!200704) (not e!220866))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35890 (= res!200704 (validMask!0 mask!1842))))

(assert (=> start!35890 e!220866))

(assert (=> start!35890 tp_is_empty!8327))

(assert (=> start!35890 true))

(declare-fun array_inv!7060 (array!20207) Bool)

(assert (=> start!35890 (array_inv!7060 _keys!1456)))

(declare-fun e!220864 () Bool)

(declare-fun array_inv!7061 (array!20209) Bool)

(assert (=> start!35890 (and (array_inv!7061 _values!1208) e!220864)))

(declare-fun b!360790 () Bool)

(declare-fun res!200703 () Bool)

(assert (=> b!360790 (=> (not res!200703) (not e!220866))))

(assert (=> b!360790 (= res!200703 (not (= (select (arr!9596 _keys!1456) from!1805) k!1077)))))

(declare-fun b!360791 () Bool)

(declare-fun e!220863 () Bool)

(assert (=> b!360791 (= e!220864 (and e!220863 mapRes!14001))))

(declare-fun condMapEmpty!14001 () Bool)

(declare-fun mapDefault!14001 () ValueCell!3820)

