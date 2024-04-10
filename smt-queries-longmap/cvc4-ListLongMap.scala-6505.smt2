; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82874 () Bool)

(assert start!82874)

(declare-fun b_free!19001 () Bool)

(declare-fun b_next!19001 () Bool)

(assert (=> start!82874 (= b_free!19001 (not b_next!19001))))

(declare-fun tp!66132 () Bool)

(declare-fun b_and!30489 () Bool)

(assert (=> start!82874 (= tp!66132 b_and!30489)))

(declare-fun b!966855 () Bool)

(declare-fun res!647191 () Bool)

(declare-fun e!545017 () Bool)

(assert (=> b!966855 (=> (not res!647191) (not e!545017))))

(declare-datatypes ((array!59695 0))(
  ( (array!59696 (arr!28716 (Array (_ BitVec 32) (_ BitVec 64))) (size!29195 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59695)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59695 (_ BitVec 32)) Bool)

(assert (=> b!966855 (= res!647191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!966856 () Bool)

(declare-fun res!647188 () Bool)

(assert (=> b!966856 (=> (not res!647188) (not e!545017))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!966856 (= res!647188 (bvsgt from!2084 newFrom!159))))

(declare-fun mapIsEmpty!34708 () Bool)

(declare-fun mapRes!34708 () Bool)

(assert (=> mapIsEmpty!34708 mapRes!34708))

(declare-fun b!966857 () Bool)

(declare-fun res!647189 () Bool)

(assert (=> b!966857 (=> (not res!647189) (not e!545017))))

(declare-datatypes ((List!19936 0))(
  ( (Nil!19933) (Cons!19932 (h!21094 (_ BitVec 64)) (t!28299 List!19936)) )
))
(declare-fun arrayNoDuplicates!0 (array!59695 (_ BitVec 32) List!19936) Bool)

(assert (=> b!966857 (= res!647189 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19933))))

(declare-fun b!966858 () Bool)

(declare-fun res!647192 () Bool)

(assert (=> b!966858 (=> (not res!647192) (not e!545017))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966858 (= res!647192 (validKeyInArray!0 (select (arr!28716 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34708 () Bool)

(declare-fun tp!66131 () Bool)

(declare-fun e!545019 () Bool)

(assert (=> mapNonEmpty!34708 (= mapRes!34708 (and tp!66131 e!545019))))

(declare-datatypes ((V!34061 0))(
  ( (V!34062 (val!10955 Int)) )
))
(declare-datatypes ((ValueCell!10423 0))(
  ( (ValueCellFull!10423 (v!13513 V!34061)) (EmptyCell!10423) )
))
(declare-fun mapRest!34708 () (Array (_ BitVec 32) ValueCell!10423))

(declare-datatypes ((array!59697 0))(
  ( (array!59698 (arr!28717 (Array (_ BitVec 32) ValueCell!10423)) (size!29196 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59697)

(declare-fun mapKey!34708 () (_ BitVec 32))

(declare-fun mapValue!34708 () ValueCell!10423)

(assert (=> mapNonEmpty!34708 (= (arr!28717 _values!1400) (store mapRest!34708 mapKey!34708 mapValue!34708))))

(declare-fun b!966859 () Bool)

(declare-fun res!647190 () Bool)

(assert (=> b!966859 (=> (not res!647190) (not e!545017))))

(assert (=> b!966859 (= res!647190 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29195 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29195 _keys!1686))))))

(declare-fun b!966860 () Bool)

(declare-fun e!545018 () Bool)

(declare-fun e!545020 () Bool)

(assert (=> b!966860 (= e!545018 (and e!545020 mapRes!34708))))

(declare-fun condMapEmpty!34708 () Bool)

(declare-fun mapDefault!34708 () ValueCell!10423)

