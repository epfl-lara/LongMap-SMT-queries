; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93556 () Bool)

(assert start!93556)

(declare-fun b!1058945 () Bool)

(declare-fun e!602575 () Bool)

(declare-fun tp_is_empty!24905 () Bool)

(assert (=> b!1058945 (= e!602575 tp_is_empty!24905)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun b!1058946 () Bool)

(declare-datatypes ((V!38341 0))(
  ( (V!38342 (val!12503 Int)) )
))
(declare-datatypes ((ValueCell!11749 0))(
  ( (ValueCellFull!11749 (v!15112 V!38341)) (EmptyCell!11749) )
))
(declare-datatypes ((array!66835 0))(
  ( (array!66836 (arr!32132 (Array (_ BitVec 32) ValueCell!11749)) (size!32668 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66835)

(declare-fun e!602578 () Bool)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!66837 0))(
  ( (array!66838 (arr!32133 (Array (_ BitVec 32) (_ BitVec 64))) (size!32669 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66837)

(assert (=> b!1058946 (= e!602578 (and (= (size!32668 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32669 _keys!1163) (size!32668 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (size!32669 _keys!1163) (bvadd #b00000000000000000000000000000001 mask!1515)))))))

(declare-fun res!707477 () Bool)

(assert (=> start!93556 (=> (not res!707477) (not e!602578))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93556 (= res!707477 (validMask!0 mask!1515))))

(assert (=> start!93556 e!602578))

(assert (=> start!93556 true))

(declare-fun e!602574 () Bool)

(declare-fun array_inv!24912 (array!66835) Bool)

(assert (=> start!93556 (and (array_inv!24912 _values!955) e!602574)))

(declare-fun array_inv!24913 (array!66837) Bool)

(assert (=> start!93556 (array_inv!24913 _keys!1163)))

(declare-fun mapIsEmpty!39007 () Bool)

(declare-fun mapRes!39007 () Bool)

(assert (=> mapIsEmpty!39007 mapRes!39007))

(declare-fun b!1058947 () Bool)

(declare-fun e!602576 () Bool)

(assert (=> b!1058947 (= e!602576 tp_is_empty!24905)))

(declare-fun mapNonEmpty!39007 () Bool)

(declare-fun tp!74813 () Bool)

(assert (=> mapNonEmpty!39007 (= mapRes!39007 (and tp!74813 e!602575))))

(declare-fun mapRest!39007 () (Array (_ BitVec 32) ValueCell!11749))

(declare-fun mapKey!39007 () (_ BitVec 32))

(declare-fun mapValue!39007 () ValueCell!11749)

(assert (=> mapNonEmpty!39007 (= (arr!32132 _values!955) (store mapRest!39007 mapKey!39007 mapValue!39007))))

(declare-fun b!1058948 () Bool)

(assert (=> b!1058948 (= e!602574 (and e!602576 mapRes!39007))))

(declare-fun condMapEmpty!39007 () Bool)

(declare-fun mapDefault!39007 () ValueCell!11749)

