; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93642 () Bool)

(assert start!93642)

(declare-fun b!1059447 () Bool)

(declare-fun e!602988 () Bool)

(declare-fun tp_is_empty!24947 () Bool)

(assert (=> b!1059447 (= e!602988 tp_is_empty!24947)))

(declare-fun b!1059448 () Bool)

(declare-fun res!707728 () Bool)

(declare-fun e!602985 () Bool)

(assert (=> b!1059448 (=> (not res!707728) (not e!602985))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38397 0))(
  ( (V!38398 (val!12524 Int)) )
))
(declare-datatypes ((ValueCell!11770 0))(
  ( (ValueCellFull!11770 (v!15134 V!38397)) (EmptyCell!11770) )
))
(declare-datatypes ((array!66925 0))(
  ( (array!66926 (arr!32172 (Array (_ BitVec 32) ValueCell!11770)) (size!32708 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66925)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!66927 0))(
  ( (array!66928 (arr!32173 (Array (_ BitVec 32) (_ BitVec 64))) (size!32709 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66927)

(assert (=> b!1059448 (= res!707728 (and (= (size!32708 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32709 _keys!1163) (size!32708 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!707726 () Bool)

(assert (=> start!93642 (=> (not res!707726) (not e!602985))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93642 (= res!707726 (validMask!0 mask!1515))))

(assert (=> start!93642 e!602985))

(assert (=> start!93642 true))

(declare-fun e!602987 () Bool)

(declare-fun array_inv!24942 (array!66925) Bool)

(assert (=> start!93642 (and (array_inv!24942 _values!955) e!602987)))

(declare-fun array_inv!24943 (array!66927) Bool)

(assert (=> start!93642 (array_inv!24943 _keys!1163)))

(declare-fun mapNonEmpty!39085 () Bool)

(declare-fun mapRes!39085 () Bool)

(declare-fun tp!74891 () Bool)

(assert (=> mapNonEmpty!39085 (= mapRes!39085 (and tp!74891 e!602988))))

(declare-fun mapRest!39085 () (Array (_ BitVec 32) ValueCell!11770))

(declare-fun mapKey!39085 () (_ BitVec 32))

(declare-fun mapValue!39085 () ValueCell!11770)

(assert (=> mapNonEmpty!39085 (= (arr!32172 _values!955) (store mapRest!39085 mapKey!39085 mapValue!39085))))

(declare-fun b!1059449 () Bool)

(assert (=> b!1059449 (= e!602985 false)))

(declare-fun lt!467125 () Bool)

(declare-datatypes ((List!22430 0))(
  ( (Nil!22427) (Cons!22426 (h!23635 (_ BitVec 64)) (t!31737 List!22430)) )
))
(declare-fun arrayNoDuplicates!0 (array!66927 (_ BitVec 32) List!22430) Bool)

(assert (=> b!1059449 (= lt!467125 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22427))))

(declare-fun b!1059450 () Bool)

(declare-fun e!602984 () Bool)

(assert (=> b!1059450 (= e!602984 tp_is_empty!24947)))

(declare-fun b!1059451 () Bool)

(declare-fun res!707727 () Bool)

(assert (=> b!1059451 (=> (not res!707727) (not e!602985))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66927 (_ BitVec 32)) Bool)

(assert (=> b!1059451 (= res!707727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1059452 () Bool)

(assert (=> b!1059452 (= e!602987 (and e!602984 mapRes!39085))))

(declare-fun condMapEmpty!39085 () Bool)

(declare-fun mapDefault!39085 () ValueCell!11770)

