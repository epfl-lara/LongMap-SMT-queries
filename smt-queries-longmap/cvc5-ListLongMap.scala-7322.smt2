; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93584 () Bool)

(assert start!93584)

(declare-fun mapNonEmpty!39034 () Bool)

(declare-fun mapRes!39034 () Bool)

(declare-fun tp!74840 () Bool)

(declare-fun e!602703 () Bool)

(assert (=> mapNonEmpty!39034 (= mapRes!39034 (and tp!74840 e!602703))))

(declare-datatypes ((V!38361 0))(
  ( (V!38362 (val!12510 Int)) )
))
(declare-datatypes ((ValueCell!11756 0))(
  ( (ValueCellFull!11756 (v!15119 V!38361)) (EmptyCell!11756) )
))
(declare-fun mapRest!39034 () (Array (_ BitVec 32) ValueCell!11756))

(declare-fun mapValue!39034 () ValueCell!11756)

(declare-datatypes ((array!66863 0))(
  ( (array!66864 (arr!32144 (Array (_ BitVec 32) ValueCell!11756)) (size!32680 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66863)

(declare-fun mapKey!39034 () (_ BitVec 32))

(assert (=> mapNonEmpty!39034 (= (arr!32144 _values!955) (store mapRest!39034 mapKey!39034 mapValue!39034))))

(declare-fun res!707527 () Bool)

(declare-fun e!602701 () Bool)

(assert (=> start!93584 (=> (not res!707527) (not e!602701))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93584 (= res!707527 (validMask!0 mask!1515))))

(assert (=> start!93584 e!602701))

(assert (=> start!93584 true))

(declare-fun e!602704 () Bool)

(declare-fun array_inv!24922 (array!66863) Bool)

(assert (=> start!93584 (and (array_inv!24922 _values!955) e!602704)))

(declare-datatypes ((array!66865 0))(
  ( (array!66866 (arr!32145 (Array (_ BitVec 32) (_ BitVec 64))) (size!32681 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66865)

(declare-fun array_inv!24923 (array!66865) Bool)

(assert (=> start!93584 (array_inv!24923 _keys!1163)))

(declare-fun b!1059079 () Bool)

(assert (=> b!1059079 (= e!602701 (and (bvsle #b00000000000000000000000000000000 (size!32681 _keys!1163)) (bvsge (size!32681 _keys!1163) #b01111111111111111111111111111111)))))

(declare-fun b!1059080 () Bool)

(declare-fun res!707528 () Bool)

(assert (=> b!1059080 (=> (not res!707528) (not e!602701))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1059080 (= res!707528 (and (= (size!32680 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32681 _keys!1163) (size!32680 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1059081 () Bool)

(declare-fun e!602700 () Bool)

(declare-fun tp_is_empty!24919 () Bool)

(assert (=> b!1059081 (= e!602700 tp_is_empty!24919)))

(declare-fun b!1059082 () Bool)

(declare-fun res!707526 () Bool)

(assert (=> b!1059082 (=> (not res!707526) (not e!602701))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66865 (_ BitVec 32)) Bool)

(assert (=> b!1059082 (= res!707526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!39034 () Bool)

(assert (=> mapIsEmpty!39034 mapRes!39034))

(declare-fun b!1059083 () Bool)

(assert (=> b!1059083 (= e!602703 tp_is_empty!24919)))

(declare-fun b!1059084 () Bool)

(assert (=> b!1059084 (= e!602704 (and e!602700 mapRes!39034))))

(declare-fun condMapEmpty!39034 () Bool)

(declare-fun mapDefault!39034 () ValueCell!11756)

