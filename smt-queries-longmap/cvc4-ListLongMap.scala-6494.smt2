; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82808 () Bool)

(assert start!82808)

(declare-fun b_free!18935 () Bool)

(declare-fun b_next!18935 () Bool)

(assert (=> start!82808 (= b_free!18935 (not b_next!18935))))

(declare-fun tp!65933 () Bool)

(declare-fun b_and!30423 () Bool)

(assert (=> start!82808 (= tp!65933 b_and!30423)))

(declare-fun b!965939 () Bool)

(declare-fun res!646568 () Bool)

(declare-fun e!544526 () Bool)

(assert (=> b!965939 (=> (not res!646568) (not e!544526))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33973 0))(
  ( (V!33974 (val!10922 Int)) )
))
(declare-datatypes ((ValueCell!10390 0))(
  ( (ValueCellFull!10390 (v!13480 V!33973)) (EmptyCell!10390) )
))
(declare-datatypes ((array!59571 0))(
  ( (array!59572 (arr!28654 (Array (_ BitVec 32) ValueCell!10390)) (size!29133 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59571)

(declare-datatypes ((array!59573 0))(
  ( (array!59574 (arr!28655 (Array (_ BitVec 32) (_ BitVec 64))) (size!29134 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59573)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!965939 (= res!646568 (and (= (size!29133 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29134 _keys!1686) (size!29133 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!965941 () Bool)

(declare-fun res!646569 () Bool)

(assert (=> b!965941 (=> (not res!646569) (not e!544526))))

(declare-datatypes ((List!19888 0))(
  ( (Nil!19885) (Cons!19884 (h!21046 (_ BitVec 64)) (t!28251 List!19888)) )
))
(declare-fun arrayNoDuplicates!0 (array!59573 (_ BitVec 32) List!19888) Bool)

(assert (=> b!965941 (= res!646569 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19885))))

(declare-fun mapIsEmpty!34609 () Bool)

(declare-fun mapRes!34609 () Bool)

(assert (=> mapIsEmpty!34609 mapRes!34609))

(declare-fun b!965942 () Bool)

(declare-fun e!544523 () Bool)

(declare-fun tp_is_empty!21743 () Bool)

(assert (=> b!965942 (= e!544523 tp_is_empty!21743)))

(declare-fun mapNonEmpty!34609 () Bool)

(declare-fun tp!65934 () Bool)

(declare-fun e!544525 () Bool)

(assert (=> mapNonEmpty!34609 (= mapRes!34609 (and tp!65934 e!544525))))

(declare-fun mapKey!34609 () (_ BitVec 32))

(declare-fun mapValue!34609 () ValueCell!10390)

(declare-fun mapRest!34609 () (Array (_ BitVec 32) ValueCell!10390))

(assert (=> mapNonEmpty!34609 (= (arr!28654 _values!1400) (store mapRest!34609 mapKey!34609 mapValue!34609))))

(declare-fun b!965943 () Bool)

(assert (=> b!965943 (= e!544525 tp_is_empty!21743)))

(declare-fun res!646573 () Bool)

(assert (=> start!82808 (=> (not res!646573) (not e!544526))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82808 (= res!646573 (validMask!0 mask!2110))))

(assert (=> start!82808 e!544526))

(assert (=> start!82808 true))

(declare-fun e!544522 () Bool)

(declare-fun array_inv!22193 (array!59571) Bool)

(assert (=> start!82808 (and (array_inv!22193 _values!1400) e!544522)))

(declare-fun array_inv!22194 (array!59573) Bool)

(assert (=> start!82808 (array_inv!22194 _keys!1686)))

(assert (=> start!82808 tp!65933))

(assert (=> start!82808 tp_is_empty!21743))

(declare-fun b!965940 () Bool)

(declare-fun res!646570 () Bool)

(assert (=> b!965940 (=> (not res!646570) (not e!544526))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965940 (= res!646570 (validKeyInArray!0 (select (arr!28655 _keys!1686) i!803)))))

(declare-fun b!965944 () Bool)

(assert (=> b!965944 (= e!544526 false)))

(declare-fun minValue!1342 () V!33973)

(declare-fun defaultEntry!1403 () Int)

(declare-fun lt!431278 () Bool)

(declare-fun zeroValue!1342 () V!33973)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14046 0))(
  ( (tuple2!14047 (_1!7034 (_ BitVec 64)) (_2!7034 V!33973)) )
))
(declare-datatypes ((List!19889 0))(
  ( (Nil!19886) (Cons!19885 (h!21047 tuple2!14046) (t!28252 List!19889)) )
))
(declare-datatypes ((ListLongMap!12743 0))(
  ( (ListLongMap!12744 (toList!6387 List!19889)) )
))
(declare-fun contains!5488 (ListLongMap!12743 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3620 (array!59573 array!59571 (_ BitVec 32) (_ BitVec 32) V!33973 V!33973 (_ BitVec 32) Int) ListLongMap!12743)

(assert (=> b!965944 (= lt!431278 (contains!5488 (getCurrentListMap!3620 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28655 _keys!1686) i!803)))))

(declare-fun b!965945 () Bool)

(declare-fun res!646572 () Bool)

(assert (=> b!965945 (=> (not res!646572) (not e!544526))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!965945 (= res!646572 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29134 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29134 _keys!1686))))))

(declare-fun b!965946 () Bool)

(assert (=> b!965946 (= e!544522 (and e!544523 mapRes!34609))))

(declare-fun condMapEmpty!34609 () Bool)

(declare-fun mapDefault!34609 () ValueCell!10390)

