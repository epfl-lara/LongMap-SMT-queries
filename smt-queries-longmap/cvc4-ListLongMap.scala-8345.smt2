; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101624 () Bool)

(assert start!101624)

(declare-fun b_free!26345 () Bool)

(declare-fun b_next!26345 () Bool)

(assert (=> start!101624 (= b_free!26345 (not b_next!26345))))

(declare-fun tp!92078 () Bool)

(declare-fun b_and!43933 () Bool)

(assert (=> start!101624 (= tp!92078 b_and!43933)))

(declare-fun b!1221911 () Bool)

(declare-fun res!811789 () Bool)

(declare-fun e!693932 () Bool)

(assert (=> b!1221911 (=> res!811789 e!693932)))

(declare-datatypes ((List!26866 0))(
  ( (Nil!26863) (Cons!26862 (h!28071 (_ BitVec 64)) (t!40191 List!26866)) )
))
(declare-fun contains!7030 (List!26866 (_ BitVec 64)) Bool)

(assert (=> b!1221911 (= res!811789 (contains!7030 Nil!26863 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1221912 () Bool)

(declare-fun res!811786 () Bool)

(declare-fun e!693938 () Bool)

(assert (=> b!1221912 (=> (not res!811786) (not e!693938))))

(declare-datatypes ((array!78881 0))(
  ( (array!78882 (arr!38068 (Array (_ BitVec 32) (_ BitVec 64))) (size!38604 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78881)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1221912 (= res!811786 (= (select (arr!38068 _keys!1208) i!673) k!934))))

(declare-fun b!1221913 () Bool)

(declare-fun e!693942 () Bool)

(declare-fun tp_is_empty!31049 () Bool)

(assert (=> b!1221913 (= e!693942 tp_is_empty!31049)))

(declare-fun b!1221914 () Bool)

(declare-fun e!693940 () Bool)

(assert (=> b!1221914 (= e!693938 e!693940)))

(declare-fun res!811792 () Bool)

(assert (=> b!1221914 (=> (not res!811792) (not e!693940))))

(declare-fun lt!555849 () array!78881)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78881 (_ BitVec 32)) Bool)

(assert (=> b!1221914 (= res!811792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!555849 mask!1564))))

(assert (=> b!1221914 (= lt!555849 (array!78882 (store (arr!38068 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38604 _keys!1208)))))

(declare-fun res!811785 () Bool)

(assert (=> start!101624 (=> (not res!811785) (not e!693938))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!101624 (= res!811785 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38604 _keys!1208))))))

(assert (=> start!101624 e!693938))

(assert (=> start!101624 tp_is_empty!31049))

(declare-fun array_inv!28964 (array!78881) Bool)

(assert (=> start!101624 (array_inv!28964 _keys!1208)))

(assert (=> start!101624 true))

(assert (=> start!101624 tp!92078))

(declare-datatypes ((V!46525 0))(
  ( (V!46526 (val!15581 Int)) )
))
(declare-datatypes ((ValueCell!14815 0))(
  ( (ValueCellFull!14815 (v!18242 V!46525)) (EmptyCell!14815) )
))
(declare-datatypes ((array!78883 0))(
  ( (array!78884 (arr!38069 (Array (_ BitVec 32) ValueCell!14815)) (size!38605 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78883)

(declare-fun e!693933 () Bool)

(declare-fun array_inv!28965 (array!78883) Bool)

(assert (=> start!101624 (and (array_inv!28965 _values!996) e!693933)))

(declare-fun b!1221915 () Bool)

(assert (=> b!1221915 (= e!693932 true)))

(declare-fun lt!555848 () Bool)

(assert (=> b!1221915 (= lt!555848 (contains!7030 Nil!26863 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1221916 () Bool)

(declare-fun res!811777 () Bool)

(assert (=> b!1221916 (=> (not res!811777) (not e!693938))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1221916 (= res!811777 (validMask!0 mask!1564))))

(declare-fun b!1221917 () Bool)

(declare-fun mapRes!48469 () Bool)

(assert (=> b!1221917 (= e!693933 (and e!693942 mapRes!48469))))

(declare-fun condMapEmpty!48469 () Bool)

(declare-fun mapDefault!48469 () ValueCell!14815)

