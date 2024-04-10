; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35886 () Bool)

(assert start!35886)

(declare-fun b!360721 () Bool)

(declare-fun res!200654 () Bool)

(declare-fun e!220835 () Bool)

(assert (=> b!360721 (=> (not res!200654) (not e!220835))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k!1077 () (_ BitVec 64))

(declare-datatypes ((array!20199 0))(
  ( (array!20200 (arr!9592 (Array (_ BitVec 32) (_ BitVec 64))) (size!9944 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20199)

(assert (=> b!360721 (= res!200654 (not (= (select (arr!9592 _keys!1456) from!1805) k!1077)))))

(declare-fun mapNonEmpty!13995 () Bool)

(declare-fun mapRes!13995 () Bool)

(declare-fun tp!28062 () Bool)

(declare-fun e!220833 () Bool)

(assert (=> mapNonEmpty!13995 (= mapRes!13995 (and tp!28062 e!220833))))

(declare-fun mapKey!13995 () (_ BitVec 32))

(declare-datatypes ((V!12075 0))(
  ( (V!12076 (val!4206 Int)) )
))
(declare-datatypes ((ValueCell!3818 0))(
  ( (ValueCellFull!3818 (v!6400 V!12075)) (EmptyCell!3818) )
))
(declare-datatypes ((array!20201 0))(
  ( (array!20202 (arr!9593 (Array (_ BitVec 32) ValueCell!3818)) (size!9945 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20201)

(declare-fun mapRest!13995 () (Array (_ BitVec 32) ValueCell!3818))

(declare-fun mapValue!13995 () ValueCell!3818)

(assert (=> mapNonEmpty!13995 (= (arr!9593 _values!1208) (store mapRest!13995 mapKey!13995 mapValue!13995))))

(declare-fun b!360722 () Bool)

(declare-fun e!220834 () Bool)

(declare-fun e!220836 () Bool)

(assert (=> b!360722 (= e!220834 (and e!220836 mapRes!13995))))

(declare-fun condMapEmpty!13995 () Bool)

(declare-fun mapDefault!13995 () ValueCell!3818)

