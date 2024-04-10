; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93618 () Bool)

(assert start!93618)

(declare-fun b!1059302 () Bool)

(declare-fun e!602866 () Bool)

(declare-fun e!602867 () Bool)

(assert (=> b!1059302 (= e!602866 e!602867)))

(declare-fun res!707649 () Bool)

(assert (=> b!1059302 (=> res!707649 e!602867)))

(declare-datatypes ((List!22425 0))(
  ( (Nil!22422) (Cons!22421 (h!23630 (_ BitVec 64)) (t!31732 List!22425)) )
))
(declare-fun contains!6216 (List!22425 (_ BitVec 64)) Bool)

(assert (=> b!1059302 (= res!707649 (contains!6216 Nil!22422 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1059303 () Bool)

(assert (=> b!1059303 (= e!602867 (contains!6216 Nil!22422 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1059304 () Bool)

(declare-fun res!707653 () Bool)

(assert (=> b!1059304 (=> (not res!707653) (not e!602866))))

(declare-datatypes ((array!66899 0))(
  ( (array!66900 (arr!32160 (Array (_ BitVec 32) (_ BitVec 64))) (size!32696 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66899)

(assert (=> b!1059304 (= res!707653 (and (bvsle #b00000000000000000000000000000000 (size!32696 _keys!1163)) (bvslt (size!32696 _keys!1163) #b01111111111111111111111111111111)))))

(declare-fun b!1059305 () Bool)

(declare-fun res!707650 () Bool)

(assert (=> b!1059305 (=> (not res!707650) (not e!602866))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38381 0))(
  ( (V!38382 (val!12518 Int)) )
))
(declare-datatypes ((ValueCell!11764 0))(
  ( (ValueCellFull!11764 (v!15127 V!38381)) (EmptyCell!11764) )
))
(declare-datatypes ((array!66901 0))(
  ( (array!66902 (arr!32161 (Array (_ BitVec 32) ValueCell!11764)) (size!32697 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66901)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1059305 (= res!707650 (and (= (size!32697 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32696 _keys!1163) (size!32697 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1059306 () Bool)

(declare-fun e!602869 () Bool)

(declare-fun tp_is_empty!24935 () Bool)

(assert (=> b!1059306 (= e!602869 tp_is_empty!24935)))

(declare-fun res!707652 () Bool)

(assert (=> start!93618 (=> (not res!707652) (not e!602866))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93618 (= res!707652 (validMask!0 mask!1515))))

(assert (=> start!93618 e!602866))

(assert (=> start!93618 true))

(declare-fun e!602868 () Bool)

(declare-fun array_inv!24932 (array!66901) Bool)

(assert (=> start!93618 (and (array_inv!24932 _values!955) e!602868)))

(declare-fun array_inv!24933 (array!66899) Bool)

(assert (=> start!93618 (array_inv!24933 _keys!1163)))

(declare-fun mapNonEmpty!39064 () Bool)

(declare-fun mapRes!39064 () Bool)

(declare-fun tp!74870 () Bool)

(assert (=> mapNonEmpty!39064 (= mapRes!39064 (and tp!74870 e!602869))))

(declare-fun mapKey!39064 () (_ BitVec 32))

(declare-fun mapRest!39064 () (Array (_ BitVec 32) ValueCell!11764))

(declare-fun mapValue!39064 () ValueCell!11764)

(assert (=> mapNonEmpty!39064 (= (arr!32161 _values!955) (store mapRest!39064 mapKey!39064 mapValue!39064))))

(declare-fun b!1059307 () Bool)

(declare-fun res!707651 () Bool)

(assert (=> b!1059307 (=> (not res!707651) (not e!602866))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66899 (_ BitVec 32)) Bool)

(assert (=> b!1059307 (= res!707651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1059308 () Bool)

(declare-fun res!707654 () Bool)

(assert (=> b!1059308 (=> (not res!707654) (not e!602866))))

(declare-fun noDuplicate!1572 (List!22425) Bool)

(assert (=> b!1059308 (= res!707654 (noDuplicate!1572 Nil!22422))))

(declare-fun b!1059309 () Bool)

(declare-fun e!602865 () Bool)

(assert (=> b!1059309 (= e!602868 (and e!602865 mapRes!39064))))

(declare-fun condMapEmpty!39064 () Bool)

(declare-fun mapDefault!39064 () ValueCell!11764)

