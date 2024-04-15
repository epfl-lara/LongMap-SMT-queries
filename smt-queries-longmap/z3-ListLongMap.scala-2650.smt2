; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39704 () Bool)

(assert start!39704)

(declare-fun b_free!9985 () Bool)

(declare-fun b_next!9985 () Bool)

(assert (=> start!39704 (= b_free!9985 (not b_next!9985))))

(declare-fun tp!35484 () Bool)

(declare-fun b_and!17615 () Bool)

(assert (=> start!39704 (= tp!35484 b_and!17615)))

(declare-fun b!426784 () Bool)

(declare-fun e!253098 () Bool)

(declare-fun tp_is_empty!11137 () Bool)

(assert (=> b!426784 (= e!253098 tp_is_empty!11137)))

(declare-fun b!426785 () Bool)

(declare-fun res!250273 () Bool)

(declare-fun e!253101 () Bool)

(assert (=> b!426785 (=> (not res!250273) (not e!253101))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!26103 0))(
  ( (array!26104 (arr!12501 (Array (_ BitVec 32) (_ BitVec 64))) (size!12854 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26103)

(assert (=> b!426785 (= res!250273 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12854 _keys!709))))))

(declare-fun mapNonEmpty!18327 () Bool)

(declare-fun mapRes!18327 () Bool)

(declare-fun tp!35483 () Bool)

(declare-fun e!253100 () Bool)

(assert (=> mapNonEmpty!18327 (= mapRes!18327 (and tp!35483 e!253100))))

(declare-datatypes ((V!15955 0))(
  ( (V!15956 (val!5613 Int)) )
))
(declare-datatypes ((ValueCell!5225 0))(
  ( (ValueCellFull!5225 (v!7854 V!15955)) (EmptyCell!5225) )
))
(declare-fun mapRest!18327 () (Array (_ BitVec 32) ValueCell!5225))

(declare-fun mapValue!18327 () ValueCell!5225)

(declare-datatypes ((array!26105 0))(
  ( (array!26106 (arr!12502 (Array (_ BitVec 32) ValueCell!5225)) (size!12855 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26105)

(declare-fun mapKey!18327 () (_ BitVec 32))

(assert (=> mapNonEmpty!18327 (= (arr!12502 _values!549) (store mapRest!18327 mapKey!18327 mapValue!18327))))

(declare-fun b!426786 () Bool)

(declare-fun res!250277 () Bool)

(declare-fun e!253096 () Bool)

(assert (=> b!426786 (=> (not res!250277) (not e!253096))))

(declare-fun lt!194924 () array!26103)

(declare-datatypes ((List!7377 0))(
  ( (Nil!7374) (Cons!7373 (h!8229 (_ BitVec 64)) (t!12812 List!7377)) )
))
(declare-fun arrayNoDuplicates!0 (array!26103 (_ BitVec 32) List!7377) Bool)

(assert (=> b!426786 (= res!250277 (arrayNoDuplicates!0 lt!194924 #b00000000000000000000000000000000 Nil!7374))))

(declare-fun mapIsEmpty!18327 () Bool)

(assert (=> mapIsEmpty!18327 mapRes!18327))

(declare-fun b!426787 () Bool)

(declare-fun res!250276 () Bool)

(assert (=> b!426787 (=> (not res!250276) (not e!253096))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!426787 (= res!250276 (bvsle from!863 i!563))))

(declare-fun b!426788 () Bool)

(declare-fun res!250279 () Bool)

(assert (=> b!426788 (=> (not res!250279) (not e!253101))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!426788 (= res!250279 (validKeyInArray!0 k0!794))))

(declare-fun b!426789 () Bool)

(declare-fun e!253099 () Bool)

(assert (=> b!426789 (= e!253099 (and e!253098 mapRes!18327))))

(declare-fun condMapEmpty!18327 () Bool)

(declare-fun mapDefault!18327 () ValueCell!5225)

(assert (=> b!426789 (= condMapEmpty!18327 (= (arr!12502 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5225)) mapDefault!18327)))))

(declare-fun b!426790 () Bool)

(assert (=> b!426790 (= e!253100 tp_is_empty!11137)))

(declare-fun b!426791 () Bool)

(declare-fun res!250270 () Bool)

(assert (=> b!426791 (=> (not res!250270) (not e!253101))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!426791 (= res!250270 (and (= (size!12855 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12854 _keys!709) (size!12855 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!426792 () Bool)

(declare-fun res!250281 () Bool)

(assert (=> b!426792 (=> (not res!250281) (not e!253101))))

(assert (=> b!426792 (= res!250281 (or (= (select (arr!12501 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12501 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!426793 () Bool)

(declare-fun res!250275 () Bool)

(assert (=> b!426793 (=> (not res!250275) (not e!253101))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!426793 (= res!250275 (validMask!0 mask!1025))))

(declare-fun b!426794 () Bool)

(declare-fun e!253095 () Bool)

(assert (=> b!426794 (= e!253096 e!253095)))

(declare-fun res!250271 () Bool)

(assert (=> b!426794 (=> (not res!250271) (not e!253095))))

(assert (=> b!426794 (= res!250271 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!15955)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15955)

(declare-datatypes ((tuple2!7374 0))(
  ( (tuple2!7375 (_1!3698 (_ BitVec 64)) (_2!3698 V!15955)) )
))
(declare-datatypes ((List!7378 0))(
  ( (Nil!7375) (Cons!7374 (h!8230 tuple2!7374) (t!12813 List!7378)) )
))
(declare-datatypes ((ListLongMap!6277 0))(
  ( (ListLongMap!6278 (toList!3154 List!7378)) )
))
(declare-fun lt!194922 () ListLongMap!6277)

(declare-fun lt!194921 () array!26105)

(declare-fun getCurrentListMapNoExtraKeys!1362 (array!26103 array!26105 (_ BitVec 32) (_ BitVec 32) V!15955 V!15955 (_ BitVec 32) Int) ListLongMap!6277)

(assert (=> b!426794 (= lt!194922 (getCurrentListMapNoExtraKeys!1362 lt!194924 lt!194921 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15955)

(assert (=> b!426794 (= lt!194921 (array!26106 (store (arr!12502 _values!549) i!563 (ValueCellFull!5225 v!412)) (size!12855 _values!549)))))

(declare-fun lt!194923 () ListLongMap!6277)

(assert (=> b!426794 (= lt!194923 (getCurrentListMapNoExtraKeys!1362 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!426795 () Bool)

(declare-fun res!250274 () Bool)

(assert (=> b!426795 (=> (not res!250274) (not e!253101))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26103 (_ BitVec 32)) Bool)

(assert (=> b!426795 (= res!250274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!250278 () Bool)

(assert (=> start!39704 (=> (not res!250278) (not e!253101))))

(assert (=> start!39704 (= res!250278 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12854 _keys!709))))))

(assert (=> start!39704 e!253101))

(assert (=> start!39704 tp_is_empty!11137))

(assert (=> start!39704 tp!35484))

(assert (=> start!39704 true))

(declare-fun array_inv!9138 (array!26105) Bool)

(assert (=> start!39704 (and (array_inv!9138 _values!549) e!253099)))

(declare-fun array_inv!9139 (array!26103) Bool)

(assert (=> start!39704 (array_inv!9139 _keys!709)))

(declare-fun b!426796 () Bool)

(assert (=> b!426796 (= e!253095 (not true))))

(declare-fun +!1333 (ListLongMap!6277 tuple2!7374) ListLongMap!6277)

(assert (=> b!426796 (= (getCurrentListMapNoExtraKeys!1362 lt!194924 lt!194921 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1333 (getCurrentListMapNoExtraKeys!1362 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7375 k0!794 v!412)))))

(declare-datatypes ((Unit!12512 0))(
  ( (Unit!12513) )
))
(declare-fun lt!194920 () Unit!12512)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!504 (array!26103 array!26105 (_ BitVec 32) (_ BitVec 32) V!15955 V!15955 (_ BitVec 32) (_ BitVec 64) V!15955 (_ BitVec 32) Int) Unit!12512)

(assert (=> b!426796 (= lt!194920 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!504 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!426797 () Bool)

(assert (=> b!426797 (= e!253101 e!253096)))

(declare-fun res!250280 () Bool)

(assert (=> b!426797 (=> (not res!250280) (not e!253096))))

(assert (=> b!426797 (= res!250280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194924 mask!1025))))

(assert (=> b!426797 (= lt!194924 (array!26104 (store (arr!12501 _keys!709) i!563 k0!794) (size!12854 _keys!709)))))

(declare-fun b!426798 () Bool)

(declare-fun res!250272 () Bool)

(assert (=> b!426798 (=> (not res!250272) (not e!253101))))

(declare-fun arrayContainsKey!0 (array!26103 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!426798 (= res!250272 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!426799 () Bool)

(declare-fun res!250269 () Bool)

(assert (=> b!426799 (=> (not res!250269) (not e!253101))))

(assert (=> b!426799 (= res!250269 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7374))))

(assert (= (and start!39704 res!250278) b!426793))

(assert (= (and b!426793 res!250275) b!426791))

(assert (= (and b!426791 res!250270) b!426795))

(assert (= (and b!426795 res!250274) b!426799))

(assert (= (and b!426799 res!250269) b!426785))

(assert (= (and b!426785 res!250273) b!426788))

(assert (= (and b!426788 res!250279) b!426792))

(assert (= (and b!426792 res!250281) b!426798))

(assert (= (and b!426798 res!250272) b!426797))

(assert (= (and b!426797 res!250280) b!426786))

(assert (= (and b!426786 res!250277) b!426787))

(assert (= (and b!426787 res!250276) b!426794))

(assert (= (and b!426794 res!250271) b!426796))

(assert (= (and b!426789 condMapEmpty!18327) mapIsEmpty!18327))

(assert (= (and b!426789 (not condMapEmpty!18327)) mapNonEmpty!18327))

(get-info :version)

(assert (= (and mapNonEmpty!18327 ((_ is ValueCellFull!5225) mapValue!18327)) b!426790))

(assert (= (and b!426789 ((_ is ValueCellFull!5225) mapDefault!18327)) b!426784))

(assert (= start!39704 b!426789))

(declare-fun m!414885 () Bool)

(assert (=> b!426788 m!414885))

(declare-fun m!414887 () Bool)

(assert (=> mapNonEmpty!18327 m!414887))

(declare-fun m!414889 () Bool)

(assert (=> b!426794 m!414889))

(declare-fun m!414891 () Bool)

(assert (=> b!426794 m!414891))

(declare-fun m!414893 () Bool)

(assert (=> b!426794 m!414893))

(declare-fun m!414895 () Bool)

(assert (=> start!39704 m!414895))

(declare-fun m!414897 () Bool)

(assert (=> start!39704 m!414897))

(declare-fun m!414899 () Bool)

(assert (=> b!426795 m!414899))

(declare-fun m!414901 () Bool)

(assert (=> b!426797 m!414901))

(declare-fun m!414903 () Bool)

(assert (=> b!426797 m!414903))

(declare-fun m!414905 () Bool)

(assert (=> b!426796 m!414905))

(declare-fun m!414907 () Bool)

(assert (=> b!426796 m!414907))

(assert (=> b!426796 m!414907))

(declare-fun m!414909 () Bool)

(assert (=> b!426796 m!414909))

(declare-fun m!414911 () Bool)

(assert (=> b!426796 m!414911))

(declare-fun m!414913 () Bool)

(assert (=> b!426793 m!414913))

(declare-fun m!414915 () Bool)

(assert (=> b!426786 m!414915))

(declare-fun m!414917 () Bool)

(assert (=> b!426799 m!414917))

(declare-fun m!414919 () Bool)

(assert (=> b!426798 m!414919))

(declare-fun m!414921 () Bool)

(assert (=> b!426792 m!414921))

(check-sat (not start!39704) (not b!426786) tp_is_empty!11137 (not b!426797) (not b!426799) (not mapNonEmpty!18327) (not b!426788) (not b_next!9985) b_and!17615 (not b!426793) (not b!426796) (not b!426795) (not b!426794) (not b!426798))
(check-sat b_and!17615 (not b_next!9985))
