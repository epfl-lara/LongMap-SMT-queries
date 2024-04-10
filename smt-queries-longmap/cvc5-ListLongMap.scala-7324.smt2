; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93614 () Bool)

(assert start!93614)

(declare-fun b!1059248 () Bool)

(declare-fun res!707613 () Bool)

(declare-fun e!602828 () Bool)

(assert (=> b!1059248 (=> (not res!707613) (not e!602828))))

(declare-datatypes ((array!66891 0))(
  ( (array!66892 (arr!32156 (Array (_ BitVec 32) (_ BitVec 64))) (size!32692 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66891)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66891 (_ BitVec 32)) Bool)

(assert (=> b!1059248 (= res!707613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1059249 () Bool)

(declare-fun e!602832 () Bool)

(declare-fun tp_is_empty!24931 () Bool)

(assert (=> b!1059249 (= e!602832 tp_is_empty!24931)))

(declare-fun b!1059250 () Bool)

(declare-fun res!707618 () Bool)

(assert (=> b!1059250 (=> (not res!707618) (not e!602828))))

(declare-datatypes ((V!38377 0))(
  ( (V!38378 (val!12516 Int)) )
))
(declare-datatypes ((ValueCell!11762 0))(
  ( (ValueCellFull!11762 (v!15125 V!38377)) (EmptyCell!11762) )
))
(declare-datatypes ((array!66893 0))(
  ( (array!66894 (arr!32157 (Array (_ BitVec 32) ValueCell!11762)) (size!32693 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66893)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1059250 (= res!707618 (and (= (size!32693 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32692 _keys!1163) (size!32693 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1059251 () Bool)

(declare-fun e!602833 () Bool)

(assert (=> b!1059251 (= e!602828 e!602833)))

(declare-fun res!707617 () Bool)

(assert (=> b!1059251 (=> res!707617 e!602833)))

(declare-datatypes ((List!22423 0))(
  ( (Nil!22420) (Cons!22419 (h!23628 (_ BitVec 64)) (t!31730 List!22423)) )
))
(declare-fun contains!6214 (List!22423 (_ BitVec 64)) Bool)

(assert (=> b!1059251 (= res!707617 (contains!6214 Nil!22420 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1059253 () Bool)

(declare-fun res!707614 () Bool)

(assert (=> b!1059253 (=> (not res!707614) (not e!602828))))

(assert (=> b!1059253 (= res!707614 (and (bvsle #b00000000000000000000000000000000 (size!32692 _keys!1163)) (bvslt (size!32692 _keys!1163) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!39058 () Bool)

(declare-fun mapRes!39058 () Bool)

(assert (=> mapIsEmpty!39058 mapRes!39058))

(declare-fun mapNonEmpty!39058 () Bool)

(declare-fun tp!74864 () Bool)

(declare-fun e!602831 () Bool)

(assert (=> mapNonEmpty!39058 (= mapRes!39058 (and tp!74864 e!602831))))

(declare-fun mapValue!39058 () ValueCell!11762)

(declare-fun mapKey!39058 () (_ BitVec 32))

(declare-fun mapRest!39058 () (Array (_ BitVec 32) ValueCell!11762))

(assert (=> mapNonEmpty!39058 (= (arr!32157 _values!955) (store mapRest!39058 mapKey!39058 mapValue!39058))))

(declare-fun b!1059254 () Bool)

(declare-fun res!707615 () Bool)

(assert (=> b!1059254 (=> (not res!707615) (not e!602828))))

(declare-fun noDuplicate!1570 (List!22423) Bool)

(assert (=> b!1059254 (= res!707615 (noDuplicate!1570 Nil!22420))))

(declare-fun b!1059255 () Bool)

(assert (=> b!1059255 (= e!602831 tp_is_empty!24931)))

(declare-fun b!1059256 () Bool)

(declare-fun e!602829 () Bool)

(assert (=> b!1059256 (= e!602829 (and e!602832 mapRes!39058))))

(declare-fun condMapEmpty!39058 () Bool)

(declare-fun mapDefault!39058 () ValueCell!11762)

